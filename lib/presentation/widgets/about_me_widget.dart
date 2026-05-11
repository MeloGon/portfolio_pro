import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/constants/my_strings.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeWidget extends ConsumerWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(getProfileProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile photo with gradient ring + glow
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accentPrimary, accentSecondary],
            ),
            boxShadow: [
              BoxShadow(
                color: accentPrimary.withValues(alpha: .4),
                blurRadius: 28,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(3),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpeg'),
            backgroundColor: Colors.transparent,
          ),
        ),
        const SizedBox(height: 28),
        profile.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gradient name
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [accentPrimary, accentSecondary],
                ).createShader(bounds),
                child: Text(
                  data.name ?? '',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                data.grade ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: accentSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: isDark ? textSecondary : Colors.black45,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    data.place ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? textSecondary : Colors.black45,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Available badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF10B981).withValues(alpha: .35),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'Available for work',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Social links
              Row(
                children: [
                  _SocialButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18),
                    label: 'LinkedIn',
                    onTap: () => launchUrl(
                      Uri.parse(
                        'https://www.linkedin.com/in/kevyn-mauro-melo-gonzales-183160208/',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _SocialButton(
                    icon: const FaIcon(FontAwesomeIcons.github, size: 18),
                    label: 'GitHub',
                    onTap: () =>
                        launchUrl(Uri.parse('https://github.com/MeloGon')),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text(
                'About',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? textPrimary : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                data.description ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark ? textSecondary : Colors.black54,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 28),
            ],
          ),
          error: (e, _) => const Text(MyStrings.thereIsaProblem),
          loading: () => const SizedBox.shrink(),
        ),
        const DownloadResumeWidget(),
        const SizedBox(height: 20),
        const ThemeButtonWidget(),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final String label;

  const _SocialButton({
    required this.icon,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      message: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isDark ? bgCard : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? borderColor : const Color(0xFFE2E8F0),
            ),
          ),
          child: IconTheme(
            data: IconThemeData(color: isDark ? textPrimary : Colors.black87),
            child: icon,
          ),
        ),
      ),
    );
  }
}
