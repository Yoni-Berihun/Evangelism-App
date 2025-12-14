// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outreach_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$outreachApiHash() => r'cee16c4f1e5dab36d8fc8e7823b9672ae9355c7f';

/// See also [outreachApi].
@ProviderFor(outreachApi)
final outreachApiProvider = AutoDisposeProvider<OutreachApi>.internal(
  outreachApi,
  name: r'outreachApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$outreachApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OutreachApiRef = AutoDisposeProviderRef<OutreachApi>;
String _$outreachRepositoryHash() =>
    r'da8d6a9e2ab5d371e7fbaa0ea735f981c7e10674';

/// See also [outreachRepository].
@ProviderFor(outreachRepository)
final outreachRepositoryProvider =
    AutoDisposeProvider<OutreachRepository>.internal(
      outreachRepository,
      name: r'outreachRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$outreachRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OutreachRepositoryRef = AutoDisposeProviderRef<OutreachRepository>;
String _$outreachDataHash() => r'57a4f8038685aaae8f8316b07999e19f5921d527';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [outreachData].
@ProviderFor(outreachData)
const outreachDataProvider = OutreachDataFamily();

/// See also [outreachData].
class OutreachDataFamily extends Family<AsyncValue<List<OutreachData>>> {
  /// See also [outreachData].
  const OutreachDataFamily();

  /// See also [outreachData].
  OutreachDataProvider call({String? missionId}) {
    return OutreachDataProvider(missionId: missionId);
  }

  @override
  OutreachDataProvider getProviderOverride(
    covariant OutreachDataProvider provider,
  ) {
    return call(missionId: provider.missionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'outreachDataProvider';
}

/// See also [outreachData].
class OutreachDataProvider
    extends AutoDisposeFutureProvider<List<OutreachData>> {
  /// See also [outreachData].
  OutreachDataProvider({String? missionId})
    : this._internal(
        (ref) => outreachData(ref as OutreachDataRef, missionId: missionId),
        from: outreachDataProvider,
        name: r'outreachDataProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$outreachDataHash,
        dependencies: OutreachDataFamily._dependencies,
        allTransitiveDependencies:
            OutreachDataFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  OutreachDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.missionId,
  }) : super.internal();

  final String? missionId;

  @override
  Override overrideWith(
    FutureOr<List<OutreachData>> Function(OutreachDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OutreachDataProvider._internal(
        (ref) => create(ref as OutreachDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        missionId: missionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<OutreachData>> createElement() {
    return _OutreachDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OutreachDataProvider && other.missionId == missionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, missionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OutreachDataRef on AutoDisposeFutureProviderRef<List<OutreachData>> {
  /// The parameter `missionId` of this provider.
  String? get missionId;
}

class _OutreachDataProviderElement
    extends AutoDisposeFutureProviderElement<List<OutreachData>>
    with OutreachDataRef {
  _OutreachDataProviderElement(super.provider);

  @override
  String? get missionId => (origin as OutreachDataProvider).missionId;
}

String _$outreachNumbersHash() => r'3adaaf8e3786cb629ddd7bdf58e6edb70b4b8588';

/// See also [outreachNumbers].
@ProviderFor(outreachNumbers)
const outreachNumbersProvider = OutreachNumbersFamily();

/// See also [outreachNumbers].
class OutreachNumbersFamily extends Family<AsyncValue<OutreachNumber?>> {
  /// See also [outreachNumbers].
  const OutreachNumbersFamily();

  /// See also [outreachNumbers].
  OutreachNumbersProvider call(String missionId) {
    return OutreachNumbersProvider(missionId);
  }

  @override
  OutreachNumbersProvider getProviderOverride(
    covariant OutreachNumbersProvider provider,
  ) {
    return call(provider.missionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'outreachNumbersProvider';
}

/// See also [outreachNumbers].
class OutreachNumbersProvider
    extends AutoDisposeFutureProvider<OutreachNumber?> {
  /// See also [outreachNumbers].
  OutreachNumbersProvider(String missionId)
    : this._internal(
        (ref) => outreachNumbers(ref as OutreachNumbersRef, missionId),
        from: outreachNumbersProvider,
        name: r'outreachNumbersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$outreachNumbersHash,
        dependencies: OutreachNumbersFamily._dependencies,
        allTransitiveDependencies:
            OutreachNumbersFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  OutreachNumbersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.missionId,
  }) : super.internal();

  final String missionId;

  @override
  Override overrideWith(
    FutureOr<OutreachNumber?> Function(OutreachNumbersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OutreachNumbersProvider._internal(
        (ref) => create(ref as OutreachNumbersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        missionId: missionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OutreachNumber?> createElement() {
    return _OutreachNumbersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OutreachNumbersProvider && other.missionId == missionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, missionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OutreachNumbersRef on AutoDisposeFutureProviderRef<OutreachNumber?> {
  /// The parameter `missionId` of this provider.
  String get missionId;
}

class _OutreachNumbersProviderElement
    extends AutoDisposeFutureProviderElement<OutreachNumber?>
    with OutreachNumbersRef {
  _OutreachNumbersProviderElement(super.provider);

  @override
  String get missionId => (origin as OutreachNumbersProvider).missionId;
}

String _$missionStatsHash() => r'f94d63f25f97ae2c919bde2a68bce7fa751c2e9e';

/// See also [missionStats].
@ProviderFor(missionStats)
const missionStatsProvider = MissionStatsFamily();

/// See also [missionStats].
class MissionStatsFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [missionStats].
  const MissionStatsFamily();

  /// See also [missionStats].
  MissionStatsProvider call(String missionId) {
    return MissionStatsProvider(missionId);
  }

  @override
  MissionStatsProvider getProviderOverride(
    covariant MissionStatsProvider provider,
  ) {
    return call(provider.missionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'missionStatsProvider';
}

/// See also [missionStats].
class MissionStatsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [missionStats].
  MissionStatsProvider(String missionId)
    : this._internal(
        (ref) => missionStats(ref as MissionStatsRef, missionId),
        from: missionStatsProvider,
        name: r'missionStatsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$missionStatsHash,
        dependencies: MissionStatsFamily._dependencies,
        allTransitiveDependencies:
            MissionStatsFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  MissionStatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.missionId,
  }) : super.internal();

  final String missionId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(MissionStatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MissionStatsProvider._internal(
        (ref) => create(ref as MissionStatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        missionId: missionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _MissionStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MissionStatsProvider && other.missionId == missionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, missionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MissionStatsRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `missionId` of this provider.
  String get missionId;
}

class _MissionStatsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with MissionStatsRef {
  _MissionStatsProviderElement(super.provider);

  @override
  String get missionId => (origin as MissionStatsProvider).missionId;
}

String _$outreachNotifierHash() => r'c0422f2e797709e91de8577ce2f32d262c212e51';

abstract class _$OutreachNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<OutreachData>> {
  late final String? missionId;

  FutureOr<List<OutreachData>> build(String? missionId);
}

/// See also [OutreachNotifier].
@ProviderFor(OutreachNotifier)
const outreachNotifierProvider = OutreachNotifierFamily();

/// See also [OutreachNotifier].
class OutreachNotifierFamily extends Family<AsyncValue<List<OutreachData>>> {
  /// See also [OutreachNotifier].
  const OutreachNotifierFamily();

  /// See also [OutreachNotifier].
  OutreachNotifierProvider call(String? missionId) {
    return OutreachNotifierProvider(missionId);
  }

  @override
  OutreachNotifierProvider getProviderOverride(
    covariant OutreachNotifierProvider provider,
  ) {
    return call(provider.missionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'outreachNotifierProvider';
}

/// See also [OutreachNotifier].
class OutreachNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          OutreachNotifier,
          List<OutreachData>
        > {
  /// See also [OutreachNotifier].
  OutreachNotifierProvider(String? missionId)
    : this._internal(
        () => OutreachNotifier()..missionId = missionId,
        from: outreachNotifierProvider,
        name: r'outreachNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$outreachNotifierHash,
        dependencies: OutreachNotifierFamily._dependencies,
        allTransitiveDependencies:
            OutreachNotifierFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  OutreachNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.missionId,
  }) : super.internal();

  final String? missionId;

  @override
  FutureOr<List<OutreachData>> runNotifierBuild(
    covariant OutreachNotifier notifier,
  ) {
    return notifier.build(missionId);
  }

  @override
  Override overrideWith(OutreachNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: OutreachNotifierProvider._internal(
        () => create()..missionId = missionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        missionId: missionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OutreachNotifier, List<OutreachData>>
  createElement() {
    return _OutreachNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OutreachNotifierProvider && other.missionId == missionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, missionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OutreachNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<OutreachData>> {
  /// The parameter `missionId` of this provider.
  String? get missionId;
}

class _OutreachNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          OutreachNotifier,
          List<OutreachData>
        >
    with OutreachNotifierRef {
  _OutreachNotifierProviderElement(super.provider);

  @override
  String? get missionId => (origin as OutreachNotifierProvider).missionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
