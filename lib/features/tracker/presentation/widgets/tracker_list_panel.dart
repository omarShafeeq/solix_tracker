import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../cubits/trackers_cubit.dart';
import '../cubits/trackers_state.dart';
import 'tracker_filter_bar.dart';
import 'tracker_list_item.dart';
import 'tracker_search_bar.dart';

class TrackerListPanel extends StatelessWidget {
  const TrackerListPanel({super.key, this.onCollapse, this.onRevealDetails});

  final VoidCallback? onCollapse;
  final VoidCallback? onRevealDetails;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      key: const Key('tracker_list_panel'),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TrackerListHeader(onCollapse: onCollapse),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: TrackerSearchBar(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: TrackerFilterBar(),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<TrackersCubit, TrackersState>(
              buildWhen: (previous, current) =>
                  previous.filteredTrackers != current.filteredTrackers ||
                  previous.status != current.status ||
                  previous.selectedTrackerId != current.selectedTrackerId ||
                  previous.visibleTrackerIds != current.visibleTrackerIds ||
                  previous.statusById != current.statusById ||
                  previous.errorMessage != current.errorMessage ||
                  previous.isStale != current.isStale,
              builder: (context, state) {
                if (state.status == TrackersStatus.loading &&
                    state.trackers.isEmpty) {
                  return const AppLoadingIndicator(
                    label: 'جارٍ تحميل المتتبعات',
                  );
                }
                if (state.status == TrackersStatus.error &&
                    state.trackers.isEmpty) {
                  return AppErrorView(
                    message: state.errorMessage ?? 'تعذر تحميل المتتبعات.',
                    onRetry: () => context.read<TrackersCubit>().loadTrackers(),
                  );
                }
                if (state.filteredTrackers.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text('لا توجد متتبعات مطابقة للبحث أو التصفية.'),
                    ),
                  );
                }
                return Column(
                  children: [
                    if (state.isStale && state.errorMessage != null)
                      _StaleBanner(message: state.errorMessage!),
                    const _SelectAllRow(),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.filteredTrackers.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final tracker = state.filteredTrackers[index];
                          final id = tracker.id;
                          return TrackerListItem(
                            tracker: tracker,
                            liveStatus: id == null
                                ? null
                                : state.statusById[id],
                            selected:
                                id != null && id == state.selectedTrackerId,
                            visible:
                                id != null &&
                                state.visibleTrackerIds.contains(id),
                            onTap: () {
                              if (id == null) {
                                return;
                              }
                              final alreadySelected =
                                  context
                                      .read<TrackersCubit>()
                                      .state
                                      .selectedTrackerId ==
                                  id;
                              context.read<TrackersCubit>().selectTracker(id);
                              if (alreadySelected) {
                                onRevealDetails?.call();
                              }
                            },
                            onVisibilityChanged: (_) {
                              if (id != null) {
                                context.read<TrackersCubit>().toggleVisibility(
                                  id,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackerListHeader extends StatelessWidget {
  const _TrackerListHeader({this.onCollapse});

  final VoidCallback? onCollapse;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackersCubit, TrackersState>(
      buildWhen: (previous, current) =>
          previous.trackers.length != current.trackers.length ||
          previous.filteredTrackers.length != current.filteredTrackers.length ||
          previous.status != current.status,
      builder: (context, state) {
        final showing = state.filteredTrackers.length;
        final total = state.trackers.length;
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'المتتبعات',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Container(
                key: const Key('tracker_count'),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accentSoft,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Text(
                  showing == total ? '$total' : '$showing / $total',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              PopupMenuButton<TrackerFilter>(
                tooltip: 'تصفية',
                icon: const Icon(Icons.filter_list),
                onSelected: context.read<TrackersCubit>().setFilter,
                itemBuilder: (context) => [
                  for (final filter in TrackerFilter.values)
                    PopupMenuItem(
                      value: filter,
                      child: Text(trackerFilterLabel(filter)),
                    ),
                ],
              ),
              IconButton(
                tooltip: 'تحديث المتتبعات',
                onPressed: () => context.read<TrackersCubit>().loadTrackers(),
                icon: const Icon(Icons.refresh),
              ),
              if (onCollapse != null)
                IconButton(
                  key: const Key('collapse_tracker_list'),
                  tooltip: 'طي المتتبعات',
                  onPressed: onCollapse,
                  icon: const Icon(Icons.keyboard_double_arrow_left),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SelectAllRow extends StatelessWidget {
  const _SelectAllRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackersCubit, TrackersState>(
      buildWhen: (previous, current) =>
          previous.visibleTrackerIds != current.visibleTrackerIds ||
          previous.filteredTrackers != current.filteredTrackers,
      builder: (context, state) {
        final ids = state.filteredTrackers
            .map((tracker) => tracker.id)
            .whereType<int>()
            .toSet();
        final selectedCount = ids.intersection(state.visibleTrackerIds).length;
        final allSelected = ids.isNotEmpty && selectedCount == ids.length;
        final noneSelected = selectedCount == 0;
        return DecoratedBox(
          decoration: const BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(color: Colors.transparent, width: 3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 12, 2),
            child: Row(
              children: [
                Checkbox(
                  key: const Key('tracker_visibility_all'),
                  tristate: true,
                  value: allSelected
                      ? true
                      : noneSelected
                      ? false
                      : null,
                  visualDensity: VisualDensity.compact,
                  onChanged: ids.isEmpty
                      ? null
                      : (_) => context.read<TrackersCubit>().setListedVisible(
                          !allSelected,
                        ),
                ),
                Text(
                  allSelected ? 'إلغاء تحديد الكل' : 'تحديد الكل',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StaleBanner extends StatelessWidget {
  const _StaleBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.warningSurface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          message,
          style: const TextStyle(fontSize: 12, color: AppColors.warning),
        ),
      ),
    );
  }
}
