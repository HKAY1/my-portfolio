import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 80 : 24,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkCard
            : Colors.grey.shade100,
      ),
      child: Column(
        children: [
          if (context.isDesktop) _buildDesktopFooter(context) else _buildMobileFooter(context),
          const SizedBox(height: 24),
          Divider(color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            '© ${DateTime.now().year} $fullName. Built with Flutter Web.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                tagline,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        // Contact
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Text(contactInfo.email, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(contactInfo.phone, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),

        // Social Links
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connect',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: socialLinks.map((link) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: _SocialIcon(
                      icon: _getIconForSocial(link.icon),
                      url: link.url,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        Text(
          fullName,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          tagline,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(contactInfo.email, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text(contactInfo.phone, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: socialLinks.map((link) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _SocialIcon(
                icon: _getIconForSocial(link.icon),
                url: link.url,
              ),
            );
          }).toList(),
        ),
      ],
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

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? AppColors.primary : Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 20,
            color: _isHovered ? Colors.white : Colors.grey.shade600,
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
