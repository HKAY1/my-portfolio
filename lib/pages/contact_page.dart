import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/glass_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/gradient_button.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
                title: "Let's Build Something Together",
                subtitle:
                    'Get in touch for collaborations or just a friendly chat',
              ),
            ),
            SizedBox(height: context.isDesktop ? 60 : 40),
            context.isDesktop
                ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.isDesktop ? 80 : 24,
                      vertical: context.isDesktop ? 80 : 40,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo(context)),
                        const SizedBox(width: 60),
                        Expanded(child: _buildContactForm(context)),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.isDesktop ? 80 : 24,
                      vertical: context.isDesktop ? 80 : 40,
                    ),
                    child: Column(
                      children: [
                        _buildContactInfo(context),
                        const SizedBox(height: 40),
                        _buildContactForm(context),
                      ],
                    ),
                  ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: Theme.of(context).textTheme.headlineMedium,
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 32),

        // Email
        _ContactInfoItem(
              icon: Icons.email_outlined,
              title: 'Email',
              value: contactInfo.email,
              onTap: () => _launchUrl('mailto:${contactInfo.email}'),
            )
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),

        const SizedBox(height: 24),

        // Phone
        _ContactInfoItem(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: contactInfo.phone,
              onTap: () => _launchUrl('tel:${contactInfo.phone}'),
            )
            .animate(delay: 300.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),

        const SizedBox(height: 24),

        // Location
        _ContactInfoItem(
              icon: Icons.location_on_outlined,
              title: 'Location',
              value: contactInfo.location,
            )
            .animate(delay: 400.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),

        const SizedBox(height: 40),

        // Social Links
        Text('Connect with me', style: Theme.of(context).textTheme.titleLarge)
            .animate(delay: 500.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),

        const SizedBox(height: 20),

        Row(
              children: socialLinks.map((link) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _SocialButton(
                    icon: _getIconForSocial(link.icon),
                    url: link.url,
                    label: link.name,
                  ),
                );
              }).toList(),
            )
            .animate(delay: 600.ms)
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return GlassCard(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Send me a message',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),

                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    hintText: 'John Doe',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    hintText: 'john@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Message Field
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: 'Your Message',
                    hintText: 'Tell me about your project...',
                    alignLabelWithHint: true,
                  ),
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Submit Button
                GradientButton(
                  text: 'Send Message',
                  onPressed: _handleSubmit,
                  icon: Icons.send,
                ),
              ],
            ),
          ),
        )
        .animate(delay: 300.ms)
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Compose email
      final subject = Uri.encodeComponent(
        'Message from ${_nameController.text}',
      );
      final body = Uri.encodeComponent(
        'Name: ${_nameController.text}\n'
        'Email: ${_emailController.text}\n\n'
        'Message:\n${_messageController.text}',
      );
      _launchUrl('mailto:${contactInfo.email}?subject=$subject&body=$body');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Opening email client...'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
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

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.neutralGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(value, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              if (onTap != null) const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
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
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : Theme.of(context).cardColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered
                  ? Colors.transparent
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
