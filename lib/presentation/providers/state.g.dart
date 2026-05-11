// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DarkMode)
final darkModeProvider = DarkModeProvider._();

final class DarkModeProvider extends $NotifierProvider<DarkMode, bool> {
  DarkModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'darkModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$darkModeHash();

  @$internal
  @override
  DarkMode create() => DarkMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$darkModeHash() => r'54d687970391283e693e0beb87bef8e54d34d8da';

abstract class _$DarkMode extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(LanguageMode)
final languageModeProvider = LanguageModeProvider._();

final class LanguageModeProvider
    extends $NotifierProvider<LanguageMode, AppLanguage> {
  LanguageModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageModeHash();

  @$internal
  @override
  LanguageMode create() => LanguageMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$languageModeHash() => r'7f5f18fbb47f18b30b262a49a07adbfcb6d403bd';

abstract class _$LanguageMode extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLanguage, AppLanguage>,
              AppLanguage,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
