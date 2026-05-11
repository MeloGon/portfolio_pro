import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class MetricStrip extends StatelessWidget {
  const MetricStrip({super.key, required this.metrics});

  final List<MetricItem> metrics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final metric in metrics)
          Container(
            width: 132,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? bgSurface
                  : const Color(0xFFFFFBF3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? borderColor
                    : const Color(0xFFE6D9C8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metric.value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: metric.color,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  metric.label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? textSecondary
                        : const Color(0xFF5E6869),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class MetricItem {
  const MetricItem({
    required this.value,
    required this.label,
    required this.color,
  });

  final String value;
  final String label;
  final Color color;
}
