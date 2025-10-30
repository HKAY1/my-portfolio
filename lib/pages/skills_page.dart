import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/footer.dart';
import '../config/theme.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  String _selectedCategory = 'all';

  List<Skill> get _filteredSkills {
    if (_selectedCategory == 'all') {
      return skillsData;
    }
    return skillsData.where((s) => s.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSkillsHero(context),
            _buildSkillCardsSection(context),
            _buildSkillCategoriesSection(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsHero(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Technical Skills',
            subtitle: 'Technologies and tools I work with',
          ),
          SizedBox(height: context.isDesktop ? 48 : 32),
          _buildCategoryFilters(context),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        SkillChip(
          label: 'All',
          isSelected: _selectedCategory == 'all',
          onTap: () => setState(() => _selectedCategory = 'all'),
        ),
        SkillChip(
          label: 'Development',
          isSelected: _selectedCategory == 'dev',
          onTap: () => setState(() => _selectedCategory = 'dev'),
        ),
        SkillChip(
          label: 'Tools',
          isSelected: _selectedCategory == 'tools',
          onTap: () => setState(() => _selectedCategory = 'tools'),
        ),
        SkillChip(
          label: 'Soft Skills',
          isSelected: _selectedCategory == 'soft',
          onTap: () => setState(() => _selectedCategory = 'soft'),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }

  Widget _buildSkillCardsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 60 : 40,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isDesktop
              ? 3
              : context.isTablet
                  ? 2
                  : 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: context.isDesktop ? 1.5 : 1.3,
        ),
        itemCount: _filteredSkills.length,
        itemBuilder: (context, index) {
          final skill = _filteredSkills[index];
          return GlassCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Skill Name
                Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Circular Progress
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: skill.proficiency / 100,
                        strokeWidth: 8,
                        backgroundColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          skill.proficiency >= 90
                              ? AppColors.success
                              : skill.proficiency >= 70
                                  ? AppColors.primary
                                  : AppColors.accent,
                        ),
                      ),
                    ),
                    Text(
                      '${skill.proficiency.toInt()}%',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Category Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getCategoryLabel(skill.category),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          )
              .animate(delay: Duration(milliseconds: 50 * index))
              .fadeIn(duration: 500.ms)
              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
        },
      ),
    );
  }

  Widget _buildSkillCategoriesSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 80 : 40,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Skill Categories',
            subtitle: 'Organized by expertise area',
          ),
          SizedBox(height: context.isDesktop ? 60 : 40),
          _buildCategoriesGrid(context),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    return Column(
      children: skillCategories.map((category) {
        final index = skillCategories.indexOf(category);
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        category.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: category.skills.map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkBackground
                            : AppColors.neutralLight,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        skill,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          )
              .animate(delay: Duration(milliseconds: 100 * index))
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.3, end: 0),
        );
      }).toList(),
    );
  }

  String _getCategoryLabel(String category) {
    switch (category) {
      case 'dev':
        return 'Development';
      case 'tools':
        return 'Tools';
      case 'soft':
        return 'Soft Skills';
      default:
        return 'Other';
    }
  }
}
