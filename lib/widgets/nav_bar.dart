import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../config/theme.dart';
import '../config/theme_provider.dart';
import '../utils/responsive.dart';
import 'logo_widget.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: context.isDesktop
          ? _buildDesktopNav(context, ref)
          : _buildMobileNav(context, ref),
    );
  }

  Widget _buildDesktopNav(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        LogoWidget(
          size: 28,
          onTap: () => context.go('/'),
        ),

        // Navigation Items
        Row(
          children: [
            const _NavItem(label: 'Home', route: '/'),
            const _NavItem(label: 'About', route: '/about'),
            const _NavItem(label: 'Skills', route: '/skills'),
            const _NavItem(label: 'Experience', route: '/experience'),
            const _NavItem(label: 'Achievements', route: '/achievements'),
            const _NavItem(label: 'Education', route: '/education'),
            const _NavItem(label: 'Contact', route: '/contact'),
            const SizedBox(width: 16),
            _buildThemeToggle(ref),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNav(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        LogoWidget(
          size: 24,
          onTap: () => context.go('/'),
        ),

        Row(
          children: [
            _buildThemeToggle(ref),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _showMobileMenu(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeToggle(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        ref.read(themeModeProvider.notifier).toggleTheme();
      },
      tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MobileNavItem(label: 'Home', route: '/'),
            _MobileNavItem(label: 'About', route: '/about'),
            _MobileNavItem(label: 'Skills', route: '/skills'),
            _MobileNavItem(label: 'Experience', route: '/experience'),
            _MobileNavItem(label: 'Achievements', route: '/achievements'),
            _MobileNavItem(label: 'Education', route: '/education'),
            _MobileNavItem(label: 'Contact', route: '/contact'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final String route;

  const _NavItem({required this.label, required this.route});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = GoRouterState.of(context).uri.path == widget.route;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isActive || _isHovered
                          ? AppColors.primary
                          : Theme.of(context).textTheme.bodyMedium?.color,
                      fontWeight:
                          isActive ? FontWeight.w600 : FontWeight.normal,
                    ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isActive || _isHovered ? 40 : 0,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final String route;

  const _MobileNavItem({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
