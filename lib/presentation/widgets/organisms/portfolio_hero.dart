import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/firebase_connection.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:portfolio/presentation/widgets/atoms/animated_reveal.dart';
import 'package:portfolio/presentation/widgets/atoms/glass_panel.dart';
import 'package:portfolio/presentation/widgets/download_resume_widget.dart';
import 'package:portfolio/presentation/widgets/molecules/metric_strip.dart';
import 'package:portfolio/presentation/widgets/molecules/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHero extends ConsumerWidget {
  const PortfolioHero({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(getProfileProvider);
    final t = AppTranslations(ref.watch(languageModeProvider));
    final isWide = MediaQuery.sizeOf(context).width >= 920;

    return AnimatedReveal(
      child: Padding(
        padding: EdgeInsets.only(top: isWide ? 128 : 112, bottom: 58),
        child: profile.when(
          data: (data) => isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _HeroCopy(profile: data, t: t),
                    ),
                    const SizedBox(width: 44),
                    _ProfilePanel(profile: data, t: t),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProfilePanel(profile: data, t: t),
                    const SizedBox(height: 28),
                    _HeroCopy(profile: data, t: t),
                  ],
                ),
          error: (e, _) => Text(t.error),
          loading: () => Text(t.loading),
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({required this.profile, required this.t});

  final dynamic profile;
  final AppTranslations t;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.heroEyebrow.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: accentSecondary,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.name ?? 'Kevyn Melo',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: isDark ? textPrimary : const Color(0xFF172022),
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile.grade ?? t.heroTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: accentPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            t.heroSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isDark ? textSecondary : const Color(0xFF4D5A5D),
              height: 1.55,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const DownloadResumeWidget(),
            SocialIconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18),
              label: 'LinkedIn',
              onTap: () => launchUrl(
                Uri.parse(
                  'https://www.linkedin.com/in/kevyn-mauro-melo-gonzales-183160208/',
                ),
              ),
            ),
            SocialIconButton(
              icon: const FaIcon(FontAwesomeIcons.github, size: 18),
              label: 'GitHub',
              onTap: () => launchUrl(Uri.parse('https://github.com/MeloGon')),
            ),
          ],
        ),
        const SizedBox(height: 30),
        MetricStrip(
          metrics: [
            MetricItem(
              value: t.years,
              label: t.yearsLabel,
              color: accentPrimary,
            ),
            MetricItem(
              value: t.shipped,
              label: t.shippedLabel,
              color: accentSecondary,
            ),
            MetricItem(
              value: t.platforms,
              label: t.platformsLabel,
              color: accentWarm,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfilePanel extends StatefulWidget {
  const _ProfilePanel({required this.profile, required this.t});

  final dynamic profile;
  final AppTranslations t;

  @override
  State<_ProfilePanel> createState() => _ProfilePanelState();
}

class _ProfilePanelState extends State<_ProfilePanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -8 + (_controller.value * 16)),
          child: child,
        );
      },
      child: SizedBox(
        width: 330,
        child: GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [accentPrimary, accentSecondary, accentWarm],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'assets/images/profile.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.t.available,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: const Color(0xFF22C55E),
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.profile.place ?? '',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? textSecondary
                                    : const Color(0xFF5E6869),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                widget.profile.description ?? '',
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.55,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? textSecondary
                      : const Color(0xFF4D5A5D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
