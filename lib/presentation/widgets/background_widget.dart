import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _PortfolioBackgroundPainter(
            progress: _controller.value,
            isDark: isDark,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _PortfolioBackgroundPainter extends CustomPainter {
  const _PortfolioBackgroundPainter({
    required this.progress,
    required this.isDark,
  });

  final double progress;
  final bool isDark;

  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? const [bgPrimary, Color(0xFF102023), Color(0xFF160F0D)]
            : const [Color(0xFFF6F1E8), Color(0xFFEAF7F4), Color(0xFFFFEFE8)],
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, basePaint);

    final gridPaint = Paint()
      ..color = (isDark ? Colors.white : const Color(0xFF172022)).withValues(
        alpha: isDark ? .035 : .045,
      )
      ..strokeWidth = 1;
    const gap = 42.0;
    final drift = progress * gap;

    for (var x = -gap + drift; x < size.width + gap; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x - 80, size.height), gridPaint);
    }
    for (var y = -gap + drift; y < size.height + gap; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y + 80), gridPaint);
    }

    _drawBand(
      canvas,
      size,
      Offset(size.width * (.08 + progress * .08), size.height * .18),
      accentPrimary.withValues(alpha: isDark ? .22 : .16),
    );
    _drawBand(
      canvas,
      size,
      Offset(size.width * (.86 - progress * .06), size.height * .72),
      accentSecondary.withValues(alpha: isDark ? .18 : .12),
    );
    _drawBand(
      canvas,
      size,
      Offset(size.width * .46, size.height * (.94 - progress * .08)),
      accentWarm.withValues(alpha: isDark ? .10 : .14),
    );
  }

  void _drawBand(Canvas canvas, Size size, Offset center, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 120
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(center.dx - size.width * .38, center.dy + 40)
      ..quadraticBezierTo(
        center.dx,
        center.dy - 90,
        center.dx + size.width * .38,
        center.dy + 30,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _PortfolioBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isDark != isDark;
  }
}
