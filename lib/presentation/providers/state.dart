import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state.g.dart';

enum AppLanguage { es, en }

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => true;

  void toggleDarkMode() {
    state = !state;
  }
}

@riverpod
class LanguageMode extends _$LanguageMode {
  @override
  AppLanguage build() => AppLanguage.es;

  void toggleLanguage() {
    state = state == AppLanguage.es ? AppLanguage.en : AppLanguage.es;
  }
}
