import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

enum DashboardBreakpoint { mobile, tablet, desktop }

DashboardBreakpoint breakpointFor(double width) {
  if (width >= AppConstants.desktopBreakpoint) {
    return DashboardBreakpoint.desktop;
  }
  if (width >= AppConstants.tabletBreakpoint) {
    return DashboardBreakpoint.tablet;
  }
  return DashboardBreakpoint.mobile;
}

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({
    super.key,
    required this.breakpoint,
    required this.list,
    required this.details,
    required this.map,
    this.showList = true,
    this.showDetails = true,
    this.onOpenList,
    this.onOpenDetails,
    this.onOpenTrips,
  });

  final DashboardBreakpoint breakpoint;
  final Widget list;
  final Widget details;
  final Widget map;
  final bool showList;
  final bool showDetails;
  final VoidCallback? onOpenList;
  final VoidCallback? onOpenDetails;
  final VoidCallback? onOpenTrips;

  @override
  Widget build(BuildContext context) {
    return switch (breakpoint) {
      DashboardBreakpoint.desktop => Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showList) ...[
            SizedBox(width: AppConstants.desktopListWidth, child: list),
            const VerticalDivider(width: 1, color: AppColors.line),
          ],
          if (showDetails) ...[
            SizedBox(width: AppConstants.desktopDetailsWidth, child: details),
            const VerticalDivider(width: 1, color: AppColors.line),
          ],
          Expanded(child: map),
        ],
      ),
      DashboardBreakpoint.tablet => Stack(
        children: [
          Positioned.fill(child: map),
          if (showList)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: AppConstants.desktopListWidth,
              child: Material(
                elevation: 8,
                color: AppColors.white,
                shadowColor: AppColors.primary.withValues(alpha: 0.16),
                child: list,
              ),
            ),
          if (showDetails)
            Positioned(
              left: showList ? AppConstants.desktopListWidth : 0,
              top: 0,
              bottom: 0,
              width: AppConstants.desktopDetailsWidth,
              child: Material(
                elevation: 8,
                color: AppColors.white,
                shadowColor: AppColors.primary.withValues(alpha: 0.16),
                child: details,
              ),
            ),
        ],
      ),
      DashboardBreakpoint.mobile => Stack(
        children: [
          Positioned.fill(child: map),
          Positioned(
            left: 12,
            right: 12,
            bottom: 16,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _MobileAction(
                    key: const Key('open_tracker_list'),
                    icon: Icons.list_alt,
                    label: 'المتتبعات',
                    onPressed: onOpenList,
                  ),
                  const SizedBox(width: 8),
                  _MobileAction(
                    key: const Key('open_tracker_details'),
                    icon: Icons.info_outline,
                    label: 'التفاصيل',
                    onPressed: onOpenDetails,
                  ),
                  const SizedBox(width: 8),
                  _MobileAction(
                    key: const Key('open_trip_history'),
                    icon: Icons.route,
                    label: 'الرحلات',
                    onPressed: onOpenTrips,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    };
  }
}

class _MobileAction extends StatelessWidget {
  const _MobileAction({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      elevation: 4,
      shadowColor: AppColors.primary.withValues(alpha: 0.18),
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
