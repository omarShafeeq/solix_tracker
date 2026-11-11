import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/format_utils.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../data/models/tracker_model.dart';
import '../../data/models/tracker_state_model.dart';
import '../cubits/live_tracking_cubit.dart';
import '../cubits/live_tracking_state.dart';
import '../cubits/tracker_details_cubit.dart';
import '../cubits/tracker_details_state.dart';
import '../cubits/trackers_cubit.dart';
import 'detail_section.dart';

class TrackerDetailsPanel extends StatelessWidget {
  const TrackerDetailsPanel({super.key, this.onCollapse});

  final VoidCallback? onCollapse;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      key: const Key('tracker_details_panel'),
      color: AppColors.canvas,
      child: BlocBuilder<TrackerDetailsCubit, TrackerDetailsState>(
        builder: (context, details) {
          return BlocSelector<
            LiveTrackingCubit,
            LiveTrackingState,
            TrackerGpsState?
          >(
            selector: (state) => state.stateFor(details.tracker?.id),
            builder: (context, gps) {
              final tracker = details.tracker;
              if (tracker == null) {
                if (details.status == TrackerDetailsStatus.loading) {
                  return _CollapsedSection(
                    onCollapse: onCollapse,
                    child: const AppLoadingIndicator(
                      label: 'جارٍ تحميل التفاصيل',
                    ),
                  );
                }
                if (details.status == TrackerDetailsStatus.error) {
                  return _CollapsedSection(
                    onCollapse: onCollapse,
                    child: AppErrorView(
                      message:
                          details.errorMessage ?? 'تفاصيل المتتبع غير متاحة.',
                      onRetry: () {
                        final id = context
                            .read<TrackersCubit>()
                            .state
                            .selectedTrackerId;
                        if (id != null) {
                          context.read<TrackerDetailsCubit>().loadDetails(
                            id,
                            force: true,
                          );
                        }
                      },
                    ),
                  );
                }
                return _CollapsedSection(
                  onCollapse: onCollapse,
                  child: const _EmptyDetails(),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _DetailsHeader(
                    tracker: tracker,
                    gps: gps,
                    onCollapse: onCollapse,
                  ),
                  if (details.isStale && details.errorMessage != null)
                    Material(
                      color: AppColors.warningSurface,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          details.errorMessage!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        DetailSection(
                          title: 'معلومات عامة',
                          icon: Icons.badge_outlined,
                          rows: [
                            DetailRow('اسم المتتبع', formatText(tracker.label)),
                            DetailRow(
                              'معرف المتتبع',
                              '${tracker.id ?? kNotAvailable}',
                            ),
                            DetailRow(
                              'معرف الجهاز',
                              formatText(tracker.source?.deviceId),
                            ),
                            DetailRow(
                              'الهاتف',
                              formatText(tracker.source?.phone),
                            ),
                            DetailRow(
                              'الطراز',
                              formatText(tracker.source?.model),
                            ),
                            DetailRow(
                              'معرف المجموعة',
                              _idText(tracker.groupId),
                            ),
                            DetailRow(
                              'تاريخ الإنشاء',
                              formatText(tracker.source?.creationDate),
                            ),
                            DetailRow(
                              'انتهاء الاشتراك',
                              formatText(tracker.source?.tariffEndDate),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'الموقع',
                          icon: Icons.place_outlined,
                          rows: [
                            DetailRow(
                              'خط العرض',
                              formatCoordinate(gps?.gps?.location?.lat),
                            ),
                            DetailRow(
                              'خط الطول',
                              formatCoordinate(gps?.gps?.location?.lng),
                            ),
                            DetailRow(
                              'الارتفاع',
                              formatAltitude(gps?.gps?.alt),
                            ),
                            DetailRow(
                              'تحديث الموقع',
                              formatApiTimestamp(gps?.gps?.updated),
                            ),
                            DetailRow(
                              'إشارة الموقع',
                              formatPercent(gps?.gps?.signalLevel),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'الحالة',
                          icon: Icons.sensors,
                          rows: [
                            DetailRow(
                              'الاتصال',
                              formatText(gps?.connectionStatus),
                            ),
                            DetailRow(
                              'الحركة',
                              formatText(gps?.movementStatus),
                            ),
                            DetailRow('السرعة', formatSpeed(gps?.gps?.speed)),
                            DetailRow(
                              'الاتجاه',
                              formatHeading(gps?.gps?.heading),
                            ),
                            DetailRow(
                              'تشغيل المحرك',
                              formatBoolStatus(gps?.ignition),
                            ),
                            DetailRow(
                              'آخر تحديث',
                              formatApiTimestamp(gps?.lastUpdate),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'المسافة المقطوعة',
                          icon: Icons.speed_outlined,
                          initiallyExpanded: false,
                          rows: [
                            DetailRow(
                              'المسافة المقطوعة',
                              mileageFromAdditional(
                                gps?.additional.map(
                                  (key, value) => MapEntry(key, value.value),
                                ),
                              ),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'معلومات شبكة الجوال',
                          icon: Icons.cell_tower,
                          initiallyExpanded: false,
                          rows: [
                            DetailRow(
                              'الشبكة',
                              formatText(gps?.gsm?.networkName),
                            ),
                            DetailRow(
                              'إشارة الجوال',
                              formatPercent(gps?.gsm?.signalLevel),
                            ),
                            DetailRow(
                              'التجوال',
                              formatBoolStatus(
                                gps?.gsm?.roaming,
                                yes: 'نعم',
                                no: 'لا',
                              ),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'البطارية',
                          icon: Icons.battery_charging_full,
                          initiallyExpanded: false,
                          rows: [
                            DetailRow(
                              'البطارية',
                              formatPercent(gps?.batteryLevel),
                            ),
                            DetailRow(
                              'تحديث البطارية',
                              formatApiTimestamp(gps?.batteryUpdate),
                            ),
                          ],
                        ),
                        DetailSection(
                          title: 'المداخل والمخارج',
                          icon: Icons.electrical_services_outlined,
                          initiallyExpanded: false,
                          rows: [
                            ..._ioRows('مدخل', gps?.inputs ?? const []),
                            ..._ioRows('مخرج', gps?.outputs ?? const []),
                          ],
                        ),
                        DetailSection(
                          title: 'معلومات الجهاز',
                          icon: Icons.memory_outlined,
                          initiallyExpanded: false,
                          rows: [
                            DetailRow(
                              'معرف المصدر',
                              _idText(gps?.sourceId ?? tracker.source?.id),
                            ),
                            DetailRow(
                              'معرف التعرفة',
                              _idText(tracker.source?.tariffId),
                            ),
                            DetailRow(
                              'محظور',
                              formatBoolStatus(
                                tracker.source?.blocked,
                                yes: 'نعم',
                                no: 'لا',
                              ),
                            ),
                            DetailRow('الوسوم', _tags(tracker)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  String _idText(int? value) => value == null ? kNotAvailable : '$value';

  String _tags(Tracker tracker) {
    final labels = tracker.tagBindings
        .where((tag) => tag.tagId != null)
        .map((tag) => 'وسم ${tag.tagId}')
        .toList();
    if (labels.isEmpty) {
      return kNotAvailable;
    }
    return labels.join(', ');
  }

  List<DetailRow> _ioRows(String prefix, List<bool> values) {
    if (values.isEmpty) {
      return [DetailRow(prefix, kNotAvailable)];
    }
    return [
      for (var index = 0; index < values.length; index++)
        DetailRow('$prefix ${index + 1}', values[index] ? 'تشغيل' : 'إيقاف'),
    ];
  }
}

class _EmptyDetails extends StatelessWidget {
  const _EmptyDetails();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'اختر متتبعاً لعرض تفاصيله.',
          style: TextStyle(color: AppColors.textMuted),
        ),
      ),
    );
  }
}

class _DetailsHeader extends StatelessWidget {
  const _DetailsHeader({
    required this.tracker,
    required this.gps,
    this.onCollapse,
  });

  final Tracker tracker;
  final TrackerGpsState? gps;
  final VoidCallback? onCollapse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatText(tracker.label),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                StatusBadge.connection(gps?.connectionStatus),
              ],
            ),
          ),
          IconButton(
            tooltip: 'تحديث التفاصيل',
            onPressed: tracker.id == null
                ? null
                : () => context.read<TrackerDetailsCubit>().loadDetails(
                    tracker.id!,
                    force: true,
                  ),
            icon: const Icon(Icons.refresh),
          ),
          if (onCollapse != null)
            IconButton(
              key: const Key('collapse_tracker_details'),
              tooltip: 'طي التفاصيل',
              onPressed: onCollapse,
              icon: const Icon(Icons.keyboard_double_arrow_left),
            ),
        ],
      ),
    );
  }
}

class _CollapsedSection extends StatelessWidget {
  const _CollapsedSection({required this.child, this.onCollapse});

  final Widget child;
  final VoidCallback? onCollapse;

  @override
  Widget build(BuildContext context) {
    if (onCollapse == null) {
      return child;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            key: const Key('collapse_tracker_details'),
            tooltip: 'طي التفاصيل',
            onPressed: onCollapse,
            icon: const Icon(Icons.keyboard_double_arrow_left),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
