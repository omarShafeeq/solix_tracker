import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/format_utils.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../tracker/presentation/cubits/trackers_cubit.dart';
import '../cubits/trip_history_cubit.dart';
import '../cubits/trip_history_state.dart';
import 'trip_list_item.dart';
import 'trip_playback_controls.dart';

class TripHistoryPanel extends StatefulWidget {
  const TripHistoryPanel({
    super.key,
    this.forceExpanded = false,
    this.expandRequest = 0,
  });

  final bool forceExpanded;
  final int expandRequest;

  @override
  State<TripHistoryPanel> createState() => _TripHistoryPanelState();
}

class _TripHistoryPanelState extends State<TripHistoryPanel> {
  bool _expanded = false;

  bool get _open => widget.forceExpanded || _expanded;

  @override
  void didUpdateWidget(TripHistoryPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expandRequest != oldWidget.expandRequest &&
        widget.expandRequest > 0) {
      setState(() => _expanded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: AppColors.primary.withValues(alpha: 0.18),
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(AppRadius.lg),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 180),
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: _open ? 340 : 52,
          child: Column(
            children: [
              InkWell(
                onTap: widget.forceExpanded
                    ? null
                    : () => setState(() => _expanded = !_expanded),
                child: SizedBox(
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.route_outlined,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'سجل الرحلات',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        if (!widget.forceExpanded)
                          Icon(
                            _open ? Icons.expand_more : Icons.expand_less,
                            color: AppColors.primary,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_open) const Expanded(child: _TripHistoryBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TripHistoryBody extends StatelessWidget {
  const _TripHistoryBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Column(
        children: [
          const _DateRangeBar(),
          const SizedBox(height: 8),
          const TripPlaybackControls(),
          const SizedBox(height: 4),
          const Expanded(child: _TripList()),
        ],
      ),
    );
  }
}

class _DateRangeBar extends StatelessWidget {
  const _DateRangeBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripHistoryCubit, TripHistoryState>(
      buildWhen: (previous, current) =>
          previous.from != current.from ||
          previous.to != current.to ||
          previous.trackerId != current.trackerId ||
          previous.status != current.status,
      builder: (context, state) {
        final trackerLabel = context.select<TrackersCubit, String>((cubit) {
          final selected = cubit.state.selectedTracker;
          if (selected == null) {
            return 'لم يتم اختيار متتبع';
          }
          final label = selected.label.trim();
          return label.isEmpty ? 'متتبع ${selected.id}' : label;
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trackerLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _pickDate(context, isStart: true),
                  child: Text(
                    state.from == null
                        ? 'البداية'
                        : formatRequestDate(state.from!),
                  ),
                ),
                TextButton(
                  onPressed: () => _pickDate(context, isStart: false),
                  child: Text(
                    state.to == null ? 'النهاية' : formatRequestDate(state.to!),
                  ),
                ),
                FilledButton(
                  onPressed: state.status == TripHistoryStatus.loading
                      ? null
                      : () => context.read<TripHistoryCubit>().loadTrips(),
                  child: const Text('تحميل'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickDate(BuildContext context, {required bool isStart}) async {
    final cubit = context.read<TripHistoryCubit>();
    final current = isStart ? cubit.state.from : cubit.state.to;
    final initial = current ?? DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2018),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !context.mounted) {
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (!context.mounted) {
      return;
    }
    final picked = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? initial.hour,
      time?.minute ?? initial.minute,
    );
    final from = isStart ? picked : cubit.state.from ?? picked;
    final to = isStart ? cubit.state.to ?? DateTime.now() : picked;
    cubit.setDateRange(from: from, to: to);
  }
}

class _TripList extends StatelessWidget {
  const _TripList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripHistoryCubit, TripHistoryState>(
      builder: (context, state) {
        if (state.status == TripHistoryStatus.loading && state.trips.isEmpty) {
          return const AppLoadingIndicator(label: 'جارٍ تحميل الرحلات');
        }
        if (state.status == TripHistoryStatus.error && state.trips.isEmpty) {
          return AppErrorView(
            message: state.errorMessage ?? 'تعذر تحميل الرحلات.',
            onRetry: () => context.read<TripHistoryCubit>().loadTrips(),
          );
        }
        if (state.status == TripHistoryStatus.empty ||
            (state.status == TripHistoryStatus.success &&
                state.trips.isEmpty)) {
          return const Center(child: Text('لا توجد رحلات في هذه الفترة.'));
        }
        if (state.trips.isEmpty) {
          return const Center(
            child: Text('اختر فترة زمنية ثم حمّل سجل الرحلات.'),
          );
        }
        return Column(
          children: [
            if (state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(
                    color: AppColors.warning,
                    fontSize: 12,
                  ),
                ),
              ),
            Expanded(
              child: ListView.separated(
                itemCount: state.trips.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return TripListItem(
                    trip: state.trips[index],
                    selected: state.selectedTripIndex == index,
                    onTap: () =>
                        context.read<TripHistoryCubit>().selectTrip(index),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
