import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubits/trackers_cubit.dart';
import '../cubits/trackers_state.dart';

class TrackerFilterBar extends StatelessWidget {
  const TrackerFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TrackersCubit, TrackersState, TrackerFilter>(
      selector: (state) => state.filter,
      builder: (context, selected) {
        return Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final filter in TrackerFilter.values)
              ChoiceChip(
                key: Key('filter_${filter.name}'),
                label: Text(_label(filter)),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                clipBehavior: Clip.antiAlias,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.standard,
                selected: selected == filter,
                selectedColor: AppColors.accentSoft,
                checkmarkColor: AppColors.accent,
                side: BorderSide(
                  color: selected == filter ? AppColors.accent : AppColors.line,
                ),
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: selected == filter
                      ? AppColors.primary
                      : AppColors.text,
                ),
                onSelected: (_) {
                  context.read<TrackersCubit>().setFilter(filter);
                },
              ),
          ],
        );
      },
    );
  }

  String _label(TrackerFilter filter) => trackerFilterLabel(filter);
}

String trackerFilterLabel(TrackerFilter filter) {
  return switch (filter) {
    TrackerFilter.all => 'الكل',
    TrackerFilter.online => 'متصل',
    TrackerFilter.offline => 'غير متصل',
    TrackerFilter.moving => 'متحرك',
    TrackerFilter.parked => 'متوقف',
    TrackerFilter.blocked => 'محظور',
  };
}
