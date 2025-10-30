import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/footer.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.isDesktop ? 80 : 24,
                vertical: context.isDesktop ? 80 : 40,
              ),
              child: const SectionTitle(
                title: 'Key Achievements',
                subtitle: 'Highlights from my professional journey',
              ),
            ),
            SizedBox(height: context.isDesktop ? 60 : 40),
            _buildAchievementsGrid(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementsGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop
            ? 3
            : context.isTablet
            ? 2
            : 1,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: context.isDesktop ? 0.9 : 1.1,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon with gradient
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: FaIcon(
                      _getIconForAchievement(achievement.icon),
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    achievement.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Expanded(
                    child: Text(
                      achievement.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),

                  // Metric
                  if (achievement.metric != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.accentGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        achievement.metric!,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ],
              ),
            )
            .animate(delay: Duration(milliseconds: 100 * index))
            .fadeIn(duration: 600.ms)
            .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
      },
    );
  }

  IconData _getIconForAchievement(String icon) {
    switch (icon.toLowerCase()) {
      case 'opensource':
        return FontAwesomeIcons.github;
      case 'delivery':
        return FontAwesomeIcons.rocket;
      case 'architecture':
        return FontAwesomeIcons.diagramProject;
      case 'mentorship':
        return FontAwesomeIcons.chalkboardUser;
      case 'platform':
        return FontAwesomeIcons.mobileScreen;
      case 'cicd':
        return FontAwesomeIcons.gears;
      default:
        return FontAwesomeIcons.trophy;
    }
  }
}
