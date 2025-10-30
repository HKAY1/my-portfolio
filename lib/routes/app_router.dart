import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/skills_page.dart';
import '../pages/experience_page.dart';
import '../pages/achievements_page.dart';
import '../pages/education_page.dart';
import '../pages/contact_page.dart';
import '../widgets/nav_bar.dart';
import '../widgets/page_wrapper.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: Column(
              children: [
                const NavBar(),
                Expanded(
                  child: child,
                ),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: HomePage()),
            ),
          ),
          GoRoute(
            path: '/about',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: AboutPage()),
            ),
          ),
          GoRoute(
            path: '/skills',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: SkillsPage()),
            ),
          ),
          GoRoute(
            path: '/experience',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: ExperiencePage()),
            ),
          ),
          GoRoute(
            path: '/achievements',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: AchievementsPage()),
            ),
          ),
          GoRoute(
            path: '/education',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: EducationPage()),
            ),
          ),
          GoRoute(
            path: '/contact',
            pageBuilder: (context, state) => _buildPageWithTransition(
              context,
              state,
              const PageWrapper(child: ContactPage()),
            ),
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _buildPageWithTransition(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0),
              end: Offset.zero,
            ).animate(CurveTween(curve: Curves.easeInOut).animate(animation)),
            child: child,
          ),
        );
      },
    );
  }
}
