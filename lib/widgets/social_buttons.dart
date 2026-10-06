import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Outlined circular button used for the third-party sign-ins.
class SocialCircleButton extends StatelessWidget {
  const SocialCircleButton({
    super.key,
    required this.child,
    required this.tooltip,
    this.onPressed,
  });

  final Widget child;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.background,
        clipBehavior: Clip.antiAlias,
        shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
        child: InkWell(
          onTap: onPressed,
          child: SizedBox.square(dimension: 58, child: Center(child: child)),
        ),
      ),
    );
  }
}

/// The multicolour Google "G", drawn so no image assets are needed.
class GoogleMark extends StatelessWidget {
  const GoogleMark({super.key, this.size = 22});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _GoogleMarkPainter()),
    );
  }
}

class _GoogleMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.22;
    final ring = (Offset.zero & size).deflate(stroke / 2);
    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    double rad(double degrees) => degrees * math.pi / 180;

    const blue = Color(0xFF4285F4);
    const segments = [
      (40.0, 80.0, Color(0xFF34A853)),
      (120.0, 95.0, Color(0xFFFBBC05)),
      (215.0, 90.0, Color(0xFFEA4335)),
      (305.0, 55.0, blue),
    ];
    for (final (start, sweep, color) in segments) {
      canvas.drawArc(ring, rad(start), rad(sweep), false, arc..color = color);
    }

    final bar = Rect.fromLTRB(
      size.width / 2,
      (size.height - stroke) / 2,
      size.width,
      (size.height + stroke) / 2,
    );
    canvas.drawRect(bar, Paint()..color = blue);
  }

  @override
  bool shouldRepaint(_GoogleMarkPainter oldDelegate) => false;
}

/// The Facebook "f" on its blue disc.
class FacebookMark extends StatelessWidget {
  const FacebookMark({super.key, this.size = 23});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFF1877F2),
        shape: BoxShape.circle,
      ),
      child: Text(
        'f',
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.72,
          height: 1.25,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
