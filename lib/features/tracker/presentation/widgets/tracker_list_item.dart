import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/format_utils.dart';
import '../../data/models/tracker_model.dart';
import '../cubits/trackers_state.dart';

class TrackerListItem extends StatelessWidget {
  const TrackerListItem({
    super.key,
    required this.tracker,
    required this.liveStatus,
    required this.selected,
    required this.visible,
    required this.onTap,
    required this.onVisibilityChanged,
  });

  final Tracker tracker;
  final TrackerLiveStatus? liveStatus;
  final bool selected;
  final bool visible;
  final VoidCallback onTap;
  final ValueChanged<bool> onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    final id = tracker.id;
    final online = liveStatus?.isOnline ?? false;
    final blocked = tracker.source?.blocked == true;
    final statusColor = blocked
        ? AppColors.blocked
        : online
        ? AppColors.online
        : AppColors.offline;
    final movement = liveStatus?.movementStatus;
    final model = tracker.source?.model;

    return Material(
      color: selected ? AppColors.selected : AppColors.white,
      child: InkWell(
        key: id == null ? null : Key('tracker_item_$id'),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: BorderDirectional(
              start: BorderSide(
                color: selected ? AppColors.accent : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 12, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  key: id == null ? null : Key('tracker_visibility_$id'),
                  value: visible,
                  visualDensity: VisualDensity.compact,
                  onChanged: (value) => onVisibilityChanged(value ?? false),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: _VehicleBadge(color: statusColor),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              tracker.label.trim().isEmpty
                                  ? 'متتبع ${id ?? ''}'
                                  : tracker.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.text,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatSpeed(liveStatus?.speed),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '#${id ?? '—'} · ${model == null || model.isEmpty ? 'الطراز غير متوفر' : model}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _movementLabel(movement, blocked),
                        style: TextStyle(fontSize: 12, color: statusColor),
                      ),
                      if (tracker.tagBindings.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: [
                            for (final tag in tracker.tagBindings)
                              if (tag.tagId != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.canvas,
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.sm,
                                    ),
                                    border: Border.all(color: AppColors.line),
                                  ),
                                  child: Text(
                                    'وسم ${tag.tagId}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _movementLabel(String? movement, bool blocked) {
    if (movement != null && movement.trim().isNotEmpty) {
      return movement;
    }
    if (blocked) {
      return 'محظور';
    }
    return liveStatus == null ? 'بانتظار الحالة' : 'الحالة غير متوفرة';
  }
}

class _VehicleBadge extends StatelessWidget {
  const _VehicleBadge({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.directions_car_filled_rounded,
                color: AppColors.accent,
                size: 22,
              ),
            ),
          ),
          PositionedDirectional(
            top: -2,
            start: -2,
            child: Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
