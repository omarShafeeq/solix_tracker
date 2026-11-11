import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/open_url.dart';
import '../../../tracker/presentation/cubits/live_tracking_cubit.dart';
import '../../../tracker/presentation/cubits/live_tracking_state.dart';
import '../../../tracker/presentation/cubits/trackers_cubit.dart';
import '../cubits/map_cubit.dart';
import '../cubits/map_state.dart';
import '../map_imagery_style.dart';

class MapLiveBar extends StatelessWidget {
  const MapLiveBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: SizedBox(
          height: 44,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const _RefreshIntervalButton(),
                const _StatsToggleButton(),
                IconButton(
                  tooltip: 'تحديث المواقع المباشرة',
                  onPressed: () =>
                      context.read<LiveTrackingCubit>().refreshStates(),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsToggleButton extends StatelessWidget {
  const _StatsToggleButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveTrackingCubit, LiveTrackingState>(
      buildWhen: (previous, current) =>
          previous.statsEnabled != current.statsEnabled,
      builder: (context, state) {
        final enabled = state.statsEnabled;
        return IconButton(
          tooltip: enabled ? 'إيقاف تحديث الحالات' : 'تشغيل تحديث الحالات',
          onPressed: () =>
              context.read<LiveTrackingCubit>().setStatsEnabled(!enabled),
          icon: Icon(
            enabled ? Icons.pause_circle_outline : Icons.play_circle_outline,
            color: enabled ? AppColors.primary : AppColors.textMuted,
          ),
        );
      },
    );
  }
}

class _RefreshIntervalButton extends StatelessWidget {
  const _RefreshIntervalButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveTrackingCubit, LiveTrackingState>(
      buildWhen: (previous, current) =>
          previous.refreshInterval != current.refreshInterval,
      builder: (context, state) {
        return PopupMenuButton<int>(
          tooltip: 'فترة التحديث',
          onSelected: (seconds) {
            context.read<LiveTrackingCubit>().updateRefreshInterval(
              Duration(seconds: seconds),
            );
          },
          itemBuilder: (context) => [
            for (final seconds in const <int>[5, 10, 15, 30, 60])
              PopupMenuItem(value: seconds, child: Text('$seconds ثانية')),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  '${state.refreshInterval.inSeconds} ث',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
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

class MapControls extends StatelessWidget {
  const MapControls({
    super.key,
    required this.onZoomIn,
    required this.onZoomOut,
  });

  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapCubitState>(
      buildWhen: (previous, current) =>
          previous.showLiveMarkers != current.showLiveMarkers,
      builder: (context, state) {
        return Material(
          elevation: 4,
          shadowColor: AppColors.primary.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(AppRadius.md),
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MapButton(
                tooltip: 'تكبير',
                icon: Icons.add,
                onPressed: onZoomIn,
              ),
              _MapButton(
                tooltip: 'تصغير',
                icon: Icons.remove,
                onPressed: onZoomOut,
              ),
              _MapButton(
                tooltip: 'ملاءمة المتتبعات الظاهرة',
                icon: Icons.fit_screen,
                onPressed: () => context.read<MapCubit>().fitAllMarkers(),
              ),
              _MapButton(
                tooltip: 'إظهار كل المتتبعات',
                icon: Icons.layers,
                onPressed: () {
                  context.read<TrackersCubit>().showAllOnMap();
                  context.read<MapCubit>().fitAllMarkers();
                },
              ),
              _MapButton(
                tooltip: state.showLiveMarkers
                    ? 'إخفاء علامات التتبع'
                    : 'إظهار علامات التتبع',
                icon: state.showLiveMarkers
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                onPressed: () => context.read<MapCubit>().setShowLiveMarkers(
                  !state.showLiveMarkers,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MapImageryToggle extends StatelessWidget {
  const MapImageryToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapCubitState>(
      buildWhen: (previous, current) => previous.imagery != current.imagery,
      builder: (context, state) {
        return Material(
          elevation: 4,
          shadowColor: AppColors.primary.withValues(alpha: 0.18),
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.line),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ImageryChoice(
                    key: const Key('map_imagery_street'),
                    tooltip: 'خريطة الشوارع',
                    label: 'شوارع',
                    icon: Icons.map_outlined,
                    selected: state.imagery == MapImagery.street,
                    onTap: () =>
                        context.read<MapCubit>().setImagery(MapImagery.street),
                  ),
                  _ImageryChoice(
                    key: const Key('map_imagery_satellite'),
                    tooltip: 'صور الأقمار الصناعية',
                    label: 'قمر صناعي',
                    icon: Icons.satellite_alt,
                    selected: state.imagery == MapImagery.satellite,
                    onTap: () => context.read<MapCubit>().setImagery(
                      MapImagery.satellite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ImageryChoice extends StatelessWidget {
  const _ImageryChoice({
    super.key,
    required this.tooltip,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String tooltip;
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? AppColors.white : AppColors.primary;
    return Tooltip(
      message: tooltip,
      child: Semantics(
        button: true,
        selected: selected,
        label: tooltip,
        child: Material(
          color: selected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18, color: foreground),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      color: foreground,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MapAttribution extends StatelessWidget {
  const MapAttribution({super.key, required this.imagery});

  final MapImagery imagery;

  @override
  Widget build(BuildContext context) {
    final style = MapImageryStyle.forImagery(imagery);
    const textStyle = TextStyle(
      fontSize: 12,
      height: 1.35,
      color: Color(0xFF323232),
    );
    const linkStyle = TextStyle(
      fontSize: 12,
      height: 1.35,
      color: Color(0xFF323232),
      decoration: TextDecoration.underline,
      decorationColor: Color(0xFF323232),
    );
    final esri = style.providerCreditUrl != null;

    return Material(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.72),
      elevation: 1,
      shadowColor: const Color(0x33000000),
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Directionality(
            textDirection: esri
                ? TextDirection.ltr
                : Directionality.of(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (esri)
                  Text.rich(
                    TextSpan(
                      style: textStyle,
                      children: [
                        const TextSpan(text: 'Powered by '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: _CreditLink(
                            label: 'Esri',
                            url: style.providerCreditUrl!,
                            style: linkStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (style.attributionUrl != null)
                  _CreditLink(
                    label: style.attribution,
                    url: style.attributionUrl!,
                    style: linkStyle,
                  )
                else
                  Text(style.attribution, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreditLink extends StatelessWidget {
  const _CreditLink({
    required this.label,
    required this.url,
    required this.style,
  });

  final String label;
  final String url;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openExternalUrl(url),
        child: Text(label, style: style),
      ),
    );
  }
}

class _MapButton extends StatelessWidget {
  const _MapButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.primary),
    );
  }
}
