import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/animated_counter.dart';
import '../widgets/gradient_button.dart';
import '../widgets/gradient_background.dart';
import '../widgets/floating_particles.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSubtitleIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentSubtitleIndex =
              (_currentSubtitleIndex + 1) % heroSubtitles.length;
        });
        _startTypingAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildQuickStatsSection(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return SizedBox(
      height: context.height * 0.9,
      child: Stack(
        children: [
          // Floating particles background
          Positioned.fill(
            child: FloatingParticles(
              particleCount: 30,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.3)
                  : AppColors.primary.withValues(alpha: 0.2),
            ),
          ),

          // Main content
          Container(
            constraints: BoxConstraints(minHeight: context.height * 0.85),
            padding: EdgeInsets.symmetric(
              horizontal: context.isDesktop ? 80 : 24,
              vertical: context.isDesktop ? 80 : 40,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Image
                  Container(
                        width: context.isDesktop ? 180 : 140,
                        height: context.isDesktop ? 180 : 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            fullName.split(' ').map((e) => e[0]).join(),
                            style: TextStyle(
                              fontSize: context.isDesktop ? 64 : 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      .animate()
                      .scale(duration: 800.ms, curve: Curves.easeOutBack)
                      .fadeIn(),

                  SizedBox(height: context.isDesktop ? 40 : 24),

                  // Name
                  Text(
                        fullName,
                        style: context.isDesktop
                            ? Theme.of(context).textTheme.displayMedium
                            : Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      )
                      .animate(delay: 300.ms)
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),

                  SizedBox(height: context.isDesktop ? 16 : 12),

                  // Tagline
                  Text(
                        tagline,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.neutralGray,
                        ),
                        textAlign: TextAlign.center,
                      )
                      .animate(delay: 500.ms)
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),

                  SizedBox(height: context.isDesktop ? 24 : 16),

                  // Animated Typing Subtitle
                  AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          heroSubtitles[_currentSubtitleIndex],
                          key: ValueKey(_currentSubtitleIndex),
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                foreground: Paint()
                                  ..shader = AppColors.primaryGradient
                                      .createShader(
                                        const Rect.fromLTWH(0, 0, 400, 50),
                                      ),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      )
                      .animate(delay: 700.ms)
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),

                  SizedBox(height: context.isDesktop ? 48 : 32),

                  // CTA Buttons
                  Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          GradientButton(
                            text: 'My Achievements',
                            onPressed: () => context.go('/achievements'),
                            icon: Icons.work_outline,
                          ),
                          GradientButton(
                            text: 'Contact Me',
                            onPressed: () => context.go('/contact'),
                            isPrimary: false,
                            icon: Icons.email_outlined,
                          ),
                        ],
                      )
                      .animate(delay: 900.ms)
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),

                  SizedBox(height: context.isDesktop ? 40 : 24),

                  // Social Links
                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: socialLinks.map((link) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: _SocialButton(
                              icon: _getIconForSocial(link.icon),
                              url: link.url,
                              label: link.name,
                            ),
                          );
                        }).toList(),
                      )
                      .animate(delay: 1100.ms)
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3, end: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      child: Column(
        children: [
          Text(
            'Quick Stats',
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          SizedBox(height: context.isDesktop ? 48 : 32),
          context.isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: quickStats
                      .map(
                        (stat) => Expanded(
                          child: AnimatedCounter(
                            value: stat.value,
                            label: stat.label,
                            suffix: stat.suffix,
                          ),
                        ),
                      )
                      .toList(),
                )
              : Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: quickStats
                      .map(
                        (stat) => SizedBox(
                          width: 150,
                          child: AnimatedCounter(
                            value: stat.value,
                            label: stat.label,
                            suffix: stat.suffix,
                          ),
                        ),
                      )
                      .toList(),
                ),
        ],
      ),
    );
  }

  IconData _getIconForSocial(String icon) {
    switch (icon.toLowerCase()) {
      case 'linkedin':
        return FontAwesomeIcons.linkedin;
      case 'github':
        return FontAwesomeIcons.github;
      case 'twitter':
        return FontAwesomeIcons.twitter;
      default:
        return FontAwesomeIcons.link;
    }
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary
                  : Theme.of(context).dividerColor,
              width: 2,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 24,
            color: _isHovered
                ? Colors.white
                : Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
