import 'package:flutter/material.dart';
import '../config/theme.dart';

class LogoWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final double size;

  const LogoWidget({
    super.key,
    this.onTap,
    this.size = 48,
  });

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: _isHovered
                  ? Colors.transparent
                  : AppColors.primary.withValues(alpha: 0.3),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              if (_isHovered) {
                return LinearGradient(
                  colors: [Colors.white, Colors.white.withValues(alpha: 0.9)],
                ).createShader(bounds);
              }
              return AppColors.primaryGradient.createShader(bounds);
            },
            child: Text(
              'HK',
              style: TextStyle(
                fontSize: widget.size,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -2,
                shadows: _isHovered
                    ? [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
