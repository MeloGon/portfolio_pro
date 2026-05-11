// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_connection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProfile)
final getProfileProvider = GetProfileProvider._();

final class GetProfileProvider
    extends $FunctionalProvider<AsyncValue<Profile>, Profile, FutureOr<Profile>>
    with $FutureModifier<Profile>, $FutureProvider<Profile> {
  GetProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProfileHash();

  @$internal
  @override
  $FutureProviderElement<Profile> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Profile> create(Ref ref) {
    return getProfile(ref);
  }
}

String _$getProfileHash() => r'a2efa8c57b4310a6777855dd26e2f55588447ea0';

@ProviderFor(getEducation)
final getEducationProvider = GetEducationProvider._();

final class GetEducationProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Education>>,
          List<Education>,
          FutureOr<List<Education>>
        >
    with $FutureModifier<List<Education>>, $FutureProvider<List<Education>> {
  GetEducationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getEducationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getEducationHash();

  @$internal
  @override
  $FutureProviderElement<List<Education>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Education>> create(Ref ref) {
    return getEducation(ref);
  }
}

String _$getEducationHash() => r'52e85b144c371f60c5f13412c8f00dae9b1b8d37';

@ProviderFor(getExperience)
final getExperienceProvider = GetExperienceProvider._();

final class GetExperienceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Experience>>,
          List<Experience>,
          FutureOr<List<Experience>>
        >
    with $FutureModifier<List<Experience>>, $FutureProvider<List<Experience>> {
  GetExperienceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExperienceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExperienceHash();

  @$internal
  @override
  $FutureProviderElement<List<Experience>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Experience>> create(Ref ref) {
    return getExperience(ref);
  }
}

String _$getExperienceHash() => r'c45c36f7552eea36ad5bfa96ce4e9dd643ef9345';

@ProviderFor(getProjects)
final getProjectsProvider = GetProjectsProvider._();

final class GetProjectsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Project>>,
          List<Project>,
          FutureOr<List<Project>>
        >
    with $FutureModifier<List<Project>>, $FutureProvider<List<Project>> {
  GetProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProjectsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProjectsHash();

  @$internal
  @override
  $FutureProviderElement<List<Project>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Project>> create(Ref ref) {
    return getProjects(ref);
  }
}

String _$getProjectsHash() => r'4b1671f8fd8408969bd6844f14eb183714ab10a8';
