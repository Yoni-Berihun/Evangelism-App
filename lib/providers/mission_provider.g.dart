// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$missionApiHash() => r'6e0263c81b2e1bceb9c6683b1c5225df092c5d58';

/// See also [missionApi].
@ProviderFor(missionApi)
final missionApiProvider = AutoDisposeProvider<MissionApi>.internal(
  missionApi,
  name: r'missionApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$missionApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MissionApiRef = AutoDisposeProviderRef<MissionApi>;
String _$missionRepositoryHash() => r'a85c32ae6b4d5ade3fe59ac5dc6a4305f0307fe1';

/// See also [missionRepository].
@ProviderFor(missionRepository)
final missionRepositoryProvider =
    AutoDisposeProvider<MissionRepository>.internal(
      missionRepository,
      name: r'missionRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$missionRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MissionRepositoryRef = AutoDisposeProviderRef<MissionRepository>;
String _$userMissionHash() => r'a0d5d713bfb43ecb7c2cfc12ec53beaf0f417ae5';

/// See also [userMission].
@ProviderFor(userMission)
final userMissionProvider = AutoDisposeFutureProvider<Mission?>.internal(
  userMission,
  name: r'userMissionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userMissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserMissionRef = AutoDisposeFutureProviderRef<Mission?>;
String _$missionariesHash() => r'c39993cf4baa56647428fe69422533c2625f6779';

/// See also [missionaries].
@ProviderFor(missionaries)
final missionariesProvider = AutoDisposeFutureProvider<List<User>>.internal(
  missionaries,
  name: r'missionariesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$missionariesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MissionariesRef = AutoDisposeFutureProviderRef<List<User>>;
String _$missionNotifierHash() => r'a7b7559e64b2db388c139cda155dc168d45e659e';

/// See also [MissionNotifier].
@ProviderFor(MissionNotifier)
final missionNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MissionNotifier, List<Mission>>.internal(
      MissionNotifier.new,
      name: r'missionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$missionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MissionNotifier = AutoDisposeAsyncNotifier<List<Mission>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
