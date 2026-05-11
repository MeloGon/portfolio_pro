import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: accentPrimary,
        foregroundColor: const Color(0xFF051010),
        minimumSize: const Size(0, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}
