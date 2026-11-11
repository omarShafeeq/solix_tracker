import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class BrandSidebar extends StatelessWidget {
  const BrandSidebar({
    super.key,
    required this.listOpen,
    required this.detailsOpen,
    required this.onToggleList,
    required this.onToggleDetails,
    required this.onOpenTrips,
  });

  final bool listOpen;
  final bool detailsOpen;
  final VoidCallback onToggleList;
  final VoidCallback onToggleDetails;
  final VoidCallback onOpenTrips;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: SizedBox(
        width: 116,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 12),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _NavButton(
                          icon: Icons.directions_car_filled_outlined,
                          label: 'المتتبعات',
                          tooltip: listOpen
                              ? 'إخفاء المتتبعات'
                              : 'إظهار المتتبعات',
                          active: listOpen,
                          onTap: onToggleList,
                        ),
                        const SizedBox(height: 8),
                        _NavButton(
                          icon: Icons.info_outline,
                          label: 'التفاصيل',
                          tooltip: detailsOpen
                              ? 'إخفاء التفاصيل'
                              : 'إظهار التفاصيل',
                          active: detailsOpen,
                          onTap: onToggleDetails,
                        ),
                        const SizedBox(height: 8),
                        _NavButton(
                          icon: Icons.route_outlined,
                          label: 'الرحلات',
                          tooltip: 'سجل الرحلات',
                          onTap: onOpenTrips,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: const SizedBox(
          height: 64,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [_BrandMark()]),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            child: Image.asset(
              'assets/images/solix_logo.png',
              height: 40,
              fit: BoxFit.contain,
              semanticLabel: 'SOLIX ERP',
            ),
          ),
          const SizedBox(width: 12),
          const Flexible(
            child: Text(
              'SOLIX Tracker System',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final String tooltip;
  final VoidCallback onTap;
  final bool active;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final background = widget.active
        ? AppColors.accent
        : _hover
        ? AppColors.primaryHover
        : Colors.transparent;
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: double.infinity,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppRadius.md),
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(widget.icon, color: AppColors.white, size: 22),
                    const SizedBox(height: 4),
                    Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
