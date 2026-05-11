import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/config/l10n/app_translations.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/presentation/providers/state.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadResumeWidget extends ConsumerWidget {
  const DownloadResumeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppTranslations(ref.watch(languageModeProvider));

    return FilledButton.icon(
      onPressed: () async {
        await launchUrl(
          Uri.parse(
            'https://drive.google.com/file/d/1kJz4i_kVKd7h3cVIauOVbpxVPnbFR3QM/view?usp=sharing',
          ),
        );
      },
      icon: const Icon(Icons.download_rounded, size: 18),
      label: Text(t.downloadCv),
      style: FilledButton.styleFrom(
        backgroundColor: accentPrimary,
        foregroundColor: const Color(0xFF051010),
        minimumSize: const Size(0, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}
