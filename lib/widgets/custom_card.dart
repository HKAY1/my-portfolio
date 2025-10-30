import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool enableHover;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.enableHover = true,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHover) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.enableHover) {
          setState(() => _isHovered = false);
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0.0, _isHovered ? -8.0 : 0.0, 0.0),
          child: Card(
            elevation: _isHovered ? 8 : 0,
            shadowColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            child: Padding(
              padding: widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
