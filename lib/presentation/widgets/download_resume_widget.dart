import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/my_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadResumeWidget extends StatelessWidget {
  const DownloadResumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launch(
            'https://drive.google.com/file/d/1kJz4i_kVKd7h3cVIauOVbpxVPnbFR3QM/view?usp=sharing');
      },
      child: const Text(MyStrings.downloadCv),
    );
  }
}
