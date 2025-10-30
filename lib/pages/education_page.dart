import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/widgets/footer.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_background.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

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
                title: 'Education & Learning',
                subtitle: 'My academic background',
              ),
            ),
            SizedBox(height: context.isDesktop ? 60 : 40),
            _buildEducationTimeline(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationTimeline(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: education.length,
      itemBuilder: (context, index) {
        final edu = education[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child:
              GlassCard(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 24),

                        // Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                edu.degree,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                edu.institution,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: AppColors.neutralGray,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    edu.location,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 16,
                                    color: AppColors.neutralGray,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '${edu.startDate} - ${edu.endDate}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate(delay: Duration(milliseconds: 200 * index))
                  .fadeIn(duration: 600.ms)
                  .slideX(begin: -0.2, end: 0),
        );
      },
    );
  }
}
