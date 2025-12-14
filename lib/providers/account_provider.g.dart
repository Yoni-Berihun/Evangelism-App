// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentAccountIdHash() => r'9fff70d248279049c3debe8f13c1c7eddfdf37e7';

/// See also [currentAccountId].
@ProviderFor(currentAccountId)
final currentAccountIdProvider = AutoDisposeFutureProvider<String?>.internal(
  currentAccountId,
  name: r'currentAccountIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAccountIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentAccountIdRef = AutoDisposeFutureProviderRef<String?>;
String _$accountNotifierHash() => r'8661feafc15a58954fd6e307371b126b0933bd38';

/// See also [AccountNotifier].
@ProviderFor(AccountNotifier)
final accountNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AccountNotifier, List<Account>?>.internal(
      AccountNotifier.new,
      name: r'accountNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$accountNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AccountNotifier = AutoDisposeAsyncNotifier<List<Account>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
