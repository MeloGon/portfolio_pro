import 'package:flutter/material.dart';

class HoverLift extends StatefulWidget {
  const HoverLift({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.025 : 1,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedSlide(
            offset: _hovered ? const Offset(0, -.015) : Offset.zero,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
