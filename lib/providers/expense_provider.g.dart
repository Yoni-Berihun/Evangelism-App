// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseApiHash() => r'ecb567baf2447a3226c4ef8b9bb43e34261815fa';

/// See also [expenseApi].
@ProviderFor(expenseApi)
final expenseApiProvider = AutoDisposeProvider<ExpenseApi>.internal(
  expenseApi,
  name: r'expenseApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseApiRef = AutoDisposeProviderRef<ExpenseApi>;
String _$expenseRepositoryHash() => r'8c41a9e20d39c11142d860acce8fd73e24a39579';

/// See also [expenseRepository].
@ProviderFor(expenseRepository)
final expenseRepositoryProvider =
    AutoDisposeProvider<ExpenseRepository>.internal(
      expenseRepository,
      name: r'expenseRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$expenseRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseRepositoryRef = AutoDisposeProviderRef<ExpenseRepository>;
String _$expensesHash() => r'3f06ad4169c1267267bf58a6e72801613086acfe';

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

/// See also [expenses].
@ProviderFor(expenses)
const expensesProvider = ExpensesFamily();

/// See also [expenses].
class ExpensesFamily extends Family<AsyncValue<List<Expense>>> {
  /// See also [expenses].
  const ExpensesFamily();

  /// See also [expenses].
  ExpensesProvider call({String? missionId}) {
    return ExpensesProvider(missionId: missionId);
  }

  @override
  ExpensesProvider getProviderOverride(covariant ExpensesProvider provider) {
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
  String? get name => r'expensesProvider';
}

/// See also [expenses].
class ExpensesProvider extends AutoDisposeFutureProvider<List<Expense>> {
  /// See also [expenses].
  ExpensesProvider({String? missionId})
    : this._internal(
        (ref) => expenses(ref as ExpensesRef, missionId: missionId),
        from: expensesProvider,
        name: r'expensesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$expensesHash,
        dependencies: ExpensesFamily._dependencies,
        allTransitiveDependencies: ExpensesFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  ExpensesProvider._internal(
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
    FutureOr<List<Expense>> Function(ExpensesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpensesProvider._internal(
        (ref) => create(ref as ExpensesRef),
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
  AutoDisposeFutureProviderElement<List<Expense>> createElement() {
    return _ExpensesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpensesProvider && other.missionId == missionId;
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
mixin ExpensesRef on AutoDisposeFutureProviderRef<List<Expense>> {
  /// The parameter `missionId` of this provider.
  String? get missionId;
}

class _ExpensesProviderElement
    extends AutoDisposeFutureProviderElement<List<Expense>>
    with ExpensesRef {
  _ExpensesProviderElement(super.provider);

  @override
  String? get missionId => (origin as ExpensesProvider).missionId;
}

String _$expenseNotifierHash() => r'c9456bdebdfb22a4ddb8b18900d7c93906172c45';

abstract class _$ExpenseNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Expense>> {
  late final String? missionId;

  FutureOr<List<Expense>> build(String? missionId);
}

/// See also [ExpenseNotifier].
@ProviderFor(ExpenseNotifier)
const expenseNotifierProvider = ExpenseNotifierFamily();

/// See also [ExpenseNotifier].
class ExpenseNotifierFamily extends Family<AsyncValue<List<Expense>>> {
  /// See also [ExpenseNotifier].
  const ExpenseNotifierFamily();

  /// See also [ExpenseNotifier].
  ExpenseNotifierProvider call(String? missionId) {
    return ExpenseNotifierProvider(missionId);
  }

  @override
  ExpenseNotifierProvider getProviderOverride(
    covariant ExpenseNotifierProvider provider,
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
  String? get name => r'expenseNotifierProvider';
}

/// See also [ExpenseNotifier].
class ExpenseNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ExpenseNotifier, List<Expense>> {
  /// See also [ExpenseNotifier].
  ExpenseNotifierProvider(String? missionId)
    : this._internal(
        () => ExpenseNotifier()..missionId = missionId,
        from: expenseNotifierProvider,
        name: r'expenseNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$expenseNotifierHash,
        dependencies: ExpenseNotifierFamily._dependencies,
        allTransitiveDependencies:
            ExpenseNotifierFamily._allTransitiveDependencies,
        missionId: missionId,
      );

  ExpenseNotifierProvider._internal(
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
  FutureOr<List<Expense>> runNotifierBuild(covariant ExpenseNotifier notifier) {
    return notifier.build(missionId);
  }

  @override
  Override overrideWith(ExpenseNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ExpenseNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ExpenseNotifier, List<Expense>>
  createElement() {
    return _ExpenseNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseNotifierProvider && other.missionId == missionId;
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
mixin ExpenseNotifierRef on AutoDisposeAsyncNotifierProviderRef<List<Expense>> {
  /// The parameter `missionId` of this provider.
  String? get missionId;
}

class _ExpenseNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ExpenseNotifier, List<Expense>>
    with ExpenseNotifierRef {
  _ExpenseNotifierProviderElement(super.provider);

  @override
  String? get missionId => (origin as ExpenseNotifierProvider).missionId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
