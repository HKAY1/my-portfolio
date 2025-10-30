import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/glass_card.dart';
import '../widgets/section_title.dart';
import '../widgets/gradient_background.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAboutHero(context),
            _buildStrengthsSection(context),
            _buildPassionsSection(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutHero(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      child: context.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Expanded(
                  flex: 2,
                  child: _buildProfileImage(context),
                ),
                const SizedBox(width: 60),
                // About Text
                Expanded(
                  flex: 3,
                  child: _buildAboutText(context),
                ),
              ],
            )
          : Column(
              children: [
                _buildProfileImage(context),
                const SizedBox(height: 40),
                _buildAboutText(context),
              ],
            ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          Container(
            width: context.isDesktop ? 300 : 250,
            height: context.isDesktop ? 300 : 250,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(24),
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
                  fontSize: context.isDesktop ? 120 : 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
              .animate()
              .scale(duration: 800.ms, curve: Curves.easeOutBack)
              .fadeIn(),
          SizedBox(height: context.isDesktop ? 24 : 16),
          Text(
            fullName,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            tagline,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          title: 'About Me',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 24),
        Text(
          aboutSummary,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _InfoChip(
              icon: Icons.email_outlined,
              label: contactInfo.email,
            ),
            _InfoChip(
              icon: Icons.phone_outlined,
              label: contactInfo.phone,
            ),
            _InfoChip(
              icon: Icons.location_on_outlined,
              label: contactInfo.location,
            ),
          ],
        )
            .animate(delay: 400.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildStrengthsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : Colors.white,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'My Strengths',
            subtitle: 'What I bring to the table',
          ),
          SizedBox(height: context.isDesktop ? 60 : 40),
          _buildStrengthsGrid(context),
        ],
      ),
    );
  }

  Widget _buildStrengthsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = context.isDesktop
            ? 3
            : context.isTablet
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: context.isDesktop ? 1.2 : 1.5,
          ),
          itemCount: strengths.length,
          itemBuilder: (context, index) {
            final strength = strengths[index];
            return GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FaIcon(
                      _getIconForStrength(strength.icon),
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    strength.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      strength.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )
                .animate(delay: Duration(milliseconds: 100 * index))
                .fadeIn(duration: 500.ms)
                .slideY(begin: 0.3, end: 0);
          },
        );
      },
    );
  }

  Widget _buildPassionsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'My Passions',
            subtitle: 'What drives me every day',
          ),
          SizedBox(height: context.isDesktop ? 60 : 40),
          _buildPassionsGrid(context),
        ],
      ),
    );
  }

  Widget _buildPassionsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = context.isDesktop
            ? 4
            : context.isTablet
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: context.isDesktop ? 1.0 : 1.5,
          ),
          itemCount: passions.length,
          itemBuilder: (context, index) {
            final passion = passions[index];
            return GlassCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: AppColors.accentGradient,
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(
                      _getIconForPassion(passion.icon),
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    passion.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    passion.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
                .animate(delay: Duration(milliseconds: 100 * index))
                .fadeIn(duration: 500.ms)
                .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
          },
        );
      },
    );
  }

  IconData _getIconForStrength(String icon) {
    switch (icon.toLowerCase()) {
      case 'architecture':
        return FontAwesomeIcons.diagramProject;
      case 'system':
        return FontAwesomeIcons.server;
      case 'leadership':
        return FontAwesomeIcons.usersGear;
      case 'learning':
        return FontAwesomeIcons.graduationCap;
      case 'problem-solving':
        return FontAwesomeIcons.lightbulb;
      case 'communication':
        return FontAwesomeIcons.comments;
      default:
        return FontAwesomeIcons.star;
    }
  }

  IconData _getIconForPassion(String icon) {
    switch (icon.toLowerCase()) {
      case 'code':
        return FontAwesomeIcons.code;
      case 'mentorship':
        return FontAwesomeIcons.chalkboardUser;
      case 'opensource':
        return FontAwesomeIcons.github;
      case 'impact':
        return FontAwesomeIcons.rocket;
      default:
        return FontAwesomeIcons.heart;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
