import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/format_utils.dart';
import '../../data/models/trip_model.dart';

class TripListItem extends StatelessWidget {
  const TripListItem({
    super.key,
    required this.trip,
    required this.selected,
    required this.onTap,
  });

  final Trip trip;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.selected : AppColors.white,
      child: InkWell(
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${formatApiTimestamp(trip.startDate)} → ${formatApiTimestamp(trip.endDate)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${formatDistance(trip.length)} · متوسط ${formatSpeed(trip.avgSpeed)} · أقصى ${formatSpeed(trip.maxSpeed)}',
                  style: const TextStyle(fontSize: 12, color: AppColors.accent),
                ),
                const SizedBox(height: 2),
                Text(
                  'المدة ${formatDuration(durationBetween(trip.startDate, trip.endDate))} · ${trip.points ?? trip.pointsList.length} نقطة',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'من ${formatText(trip.startAddress)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: AppColors.text),
                ),
                Text(
                  'إلى ${formatText(trip.endAddress)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: AppColors.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
