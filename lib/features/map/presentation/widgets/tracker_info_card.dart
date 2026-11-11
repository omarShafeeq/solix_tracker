import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/format_utils.dart';
import '../../../tracker/presentation/cubits/live_tracking_cubit.dart';
import '../../../tracker/presentation/cubits/live_tracking_state.dart';
import '../../../tracker/presentation/cubits/trackers_cubit.dart';
import '../../../tracker/presentation/cubits/trackers_state.dart';

class TrackerInfoCard extends StatelessWidget {
  const TrackerInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackersCubit, TrackersState>(
      buildWhen: (previous, current) =>
          previous.selectedTrackerId != current.selectedTrackerId ||
          previous.trackers != current.trackers,
      builder: (context, trackers) {
        final tracker = trackers.selectedTracker;
        if (tracker == null) {
          return const SizedBox.shrink();
        }
        return BlocSelector<LiveTrackingCubit, LiveTrackingState, _CardData>(
          selector: (state) {
            final gps = state.stateFor(tracker.id);
            return _CardData(
              online: gps?.connectionStatus?.toLowerCase() == 'active',
              status: formatText(gps?.connectionStatus),
              speed: formatSpeed(gps?.gps?.speed),
              updated: formatApiTimestamp(gps?.gps?.updated),
            );
          },
          builder: (context, data) {
            return Material(
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(AppRadius.md),
              color: AppColors.white,
              surfaceTintColor: AppColors.white,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: data.online
                              ? AppColors.online
                              : AppColors.offline,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tracker.label.trim().isEmpty
                                  ? 'متتبع ${tracker.id}'
                                  : tracker.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.text,
                              ),
                            ),
                            Text(
                              '${data.status} · ${data.speed}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'الموقع ${data.updated}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: 'إلغاء التحديد',
                        onPressed: () =>
                            context.read<TrackersCubit>().clearSelection(),
                        icon: const Icon(Icons.close, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CardData {
  const _CardData({
    required this.online,
    required this.status,
    required this.speed,
    required this.updated,
  });

  final bool online;
  final String status;
  final String speed;
  final String updated;
}

class MapStatusBanner extends StatelessWidget {
  const MapStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveTrackingCubit, LiveTrackingState>(
      buildWhen: (previous, current) =>
          previous.isRefreshing != current.isRefreshing ||
          previous.isStale != current.isStale ||
          previous.lastSync != current.lastSync ||
          previous.errorMessage != current.errorMessage ||
          previous.userTime != current.userTime,
      builder: (context, state) {
        final stale = state.isStale && state.errorMessage != null;
        return Material(
          elevation: 3,
          shadowColor: AppColors.primary.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          color: stale ? AppColors.warningSurface : AppColors.white,
          surfaceTintColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.isRefreshing)
                  const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  Icon(
                    stale ? Icons.sync_problem : Icons.sync,
                    size: 16,
                    color: stale ? AppColors.warning : AppColors.accent,
                  ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    stale
                        ? '${state.errorMessage} ${formatRelativeSync(state.lastSync)}.'
                        : formatRelativeSync(state.lastSync),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
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
