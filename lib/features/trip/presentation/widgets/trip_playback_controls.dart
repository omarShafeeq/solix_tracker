import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubits/trip_history_cubit.dart';
import '../cubits/trip_history_state.dart';

class TripPlaybackControls extends StatelessWidget {
  const TripPlaybackControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripHistoryCubit, TripHistoryState>(
      buildWhen: (previous, current) =>
          previous.playbackStatus != current.playbackStatus ||
          previous.playbackSpeed != current.playbackSpeed ||
          previous.selectedTripIndex != current.selectedTripIndex,
      builder: (context, state) {
        final cubit = context.read<TripHistoryCubit>();
        final playing = state.playbackStatus == PlaybackStatus.playing;
        return Wrap(
          spacing: 4,
          runSpacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            IconButton(
              tooltip: playing ? 'إيقاف مؤقت' : 'تشغيل',
              onPressed: playing ? cubit.pause : cubit.play,
              icon: Icon(
                playing ? Icons.pause_circle : Icons.play_circle,
                color: AppColors.accent,
              ),
            ),
            IconButton(
              tooltip: 'إيقاف',
              onPressed: cubit.stopPlayback,
              icon: const Icon(
                Icons.stop_circle_outlined,
                color: AppColors.primary,
              ),
            ),
            const Text(
              'السرعة',
              style: TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
            for (final speed in const <double>[1, 2, 5, 10])
              ChoiceChip(
                label: Text(
                  '${speed.toStringAsFixed(0)}x',
                  style: TextStyle(
                    color: state.playbackSpeed == speed
                        ? AppColors.primary
                        : AppColors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                selected: state.playbackSpeed == speed,
                selectedColor: AppColors.accentSoft,
                side: BorderSide(
                  color: state.playbackSpeed == speed
                      ? AppColors.accent
                      : AppColors.line,
                ),
                onSelected: (_) => cubit.setPlaybackSpeed(speed),
              ),
          ],
        );
      },
    );
  }
}
