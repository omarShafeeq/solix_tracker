import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import 'marker_factory.dart';

class VehicleMarkerIcon extends StatelessWidget {
  const VehicleMarkerIcon({
    super.key,
    required this.tone,
    required this.heading,
    this.selected = false,
    this.size = 36,
  });

  final MarkerTone tone;
  final double heading;
  final bool selected;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: heading * math.pi / 180,
      child: CustomPaint(
        size: Size.square(size),
        painter: _ArrowPainter(color: colorForTone(tone), selected: selected),
      ),
    );
  }
}

Color colorForTone(MarkerTone tone) {
  return switch (tone) {
    MarkerTone.online => AppColors.online,
    MarkerTone.parked => AppColors.parked,
    MarkerTone.offline => AppColors.offline,
    MarkerTone.blocked => AppColors.blocked,
  };
}

class _ArrowPainter extends CustomPainter {
  const _ArrowPainter({required this.color, required this.selected});

  final Color color;
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, size.height * 0.06)
      ..lineTo(size.width * 0.84, size.height * 0.86)
      ..lineTo(size.width / 2, size.height * 0.66)
      ..lineTo(size.width * 0.16, size.height * 0.86)
      ..close();
    canvas.drawPath(
      path.shift(const Offset(0, 1)),
      Paint()
        ..color = const Color(0x55000000)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5),
    );
    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
      path,
      Paint()
        ..color = AppColors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = selected ? 3 : 2,
    );
  }

  @override
  bool shouldRepaint(covariant _ArrowPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.selected != selected;
  }
}
