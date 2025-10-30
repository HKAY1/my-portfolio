import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_web/widgets/custom_card.dart';
import 'package:portfolio_web/widgets/skill_bar.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';
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
            _buildSkillBarsSection(context),
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
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildSkillBarsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: context.isDesktop ? 60 : 40,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : Colors.white,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return context.isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: _filteredSkills
                            .take((_filteredSkills.length / 2).ceil())
                            .map(
                              (skill) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: SkillBar(
                                  skillName: skill.name,
                                  proficiency: skill.proficiency,
                                  delay: _filteredSkills.indexOf(skill) * 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: _filteredSkills
                            .skip((_filteredSkills.length / 2).ceil())
                            .map(
                              (skill) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: SkillBar(
                                  skillName: skill.name,
                                  proficiency: skill.proficiency,
                                  delay: _filteredSkills.indexOf(skill) * 100,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: _filteredSkills
                      .map(
                        (skill) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: SkillBar(
                            skillName: skill.name,
                            proficiency: skill.proficiency,
                            delay: _filteredSkills.indexOf(skill) * 100,
                          ),
                        ),
                      )
                      .toList(),
                );
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
          child:
              CustomCard(
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
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
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
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.darkBackground
                                    : AppColors.neutralLight,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).dividerColor.withValues(alpha: 0.3),
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
}
