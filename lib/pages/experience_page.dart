import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/footer.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

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
                title: 'Professional Journey',
                subtitle: 'My career path and achievements',
              ),
            ),
            SizedBox(height: context.isDesktop ? 60 : 40),
            _buildTimeline(context),
            const SizedBox(height: 40),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return context.isDesktop
        ? _buildDesktopTimeline(context)
        : _buildMobileTimeline(context);
  }

  Widget _buildDesktopTimeline(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final experience = experiences[index];
        final isLeft = index % 2 == 0;

        return Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side
              Expanded(
                child: isLeft
                    ? _buildExperienceCard(context, experience, index)
                    : Container(),
              ),

              // Timeline center
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),

                    Container(
                      width: 2,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withValues(alpha: 0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Right side
              Expanded(
                child: !isLeft
                    ? _buildExperienceCard(context, experience, index)
                    : Container(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileTimeline(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final experience = experiences[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline
              Column(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  if (index < experiences.length - 1)
                    Container(
                      width: 2,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withValues(alpha: 0.3),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 20),

              // Card
              Expanded(child: _buildExperienceCard(context, experience, index)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceCard(BuildContext context, experience, int index) {
    return GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Role
              Text(
                experience.role,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),

              // Company
              Row(
                children: [
                  const Icon(
                    Icons.business,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      experience.company,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Location
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 18,
                    color: AppColors.neutralGray,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    experience.location,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Duration
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: AppColors.neutralGray,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${experience.startDate} - ${experience.endDate}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              if (experience.description.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  experience.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                ),
              ],

              const SizedBox(height: 16),
              Divider(color: Theme.of(context).dividerColor),
              const SizedBox(height: 16),

              // Highlights
              ...experience.highlights.map((highlight) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          highlight,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        )
        .animate(delay: Duration(milliseconds: 200 * index))
        .fadeIn(duration: 600.ms)
        .slideX(begin: index % 2 == 0 ? -0.2 : 0.2, end: 0);
  }
}
