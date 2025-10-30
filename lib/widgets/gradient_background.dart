import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Animated gradient mesh background
class GradientBackground extends StatefulWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  State<GradientBackground> createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
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

    return Stack(
      children: [
        // Animated gradient background
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(
                    math.cos(_controller.value * 2 * math.pi) * 0.3,
                    math.sin(_controller.value * 2 * math.pi) * 0.3,
                  ),
                  radius: 1.5,
                  colors: isDark
                      ? [
                          const Color(0xFF1E293B),
                          const Color(0xFF0F172A),
                          const Color(0xFF020617),
                        ]
                      : [
                          const Color(0xFFF8FAFC),
                          const Color(0xFFE0E7FF),
                          const Color(0xFFFCE7F3),
                        ],
                ),
              ),
            );
          },
        ),

        // Floating gradient orbs
        ...List.generate(3, (index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final offset = (index + 1) * 0.33;
              return Positioned(
                left: (MediaQuery.of(context).size.width *
                        (0.5 +
                            math.cos((_controller.value + offset) * 2 * math.pi) *
                                0.4))
                    .clamp(0, MediaQuery.of(context).size.width),
                top: (MediaQuery.of(context).size.height *
                        (0.5 +
                            math.sin((_controller.value + offset) * 2 * math.pi) *
                                0.3))
                    .clamp(0, MediaQuery.of(context).size.height),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        _getColorForIndex(index, isDark)
                            .withValues(alpha: isDark ? 0.15 : 0.3),
                        _getColorForIndex(index, isDark)
                            .withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),

        // Content
        widget.child,
      ],
    );
  }

  Color _getColorForIndex(int index, bool isDark) {
    final colors = isDark
        ? [
            const Color(0xFF2563EB),
            const Color(0xFF7C3AED),
            const Color(0xFF06B6D4),
          ]
        : [
            const Color(0xFF93C5FD),
            const Color(0xFFC4B5FD),
            const Color(0xFF67E8F9),
          ];
    return colors[index % colors.length];
  }
}
