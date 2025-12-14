import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/auth_repository.dart';
import '../models/account.dart';
import 'auth_provider.dart';

part 'account_provider.g.dart';

@riverpod
class AccountNotifier extends _$AccountNotifier {
  @override
  Future<List<Account>?> build() async {
    final user = ref.watch(authNotifierProvider).valueOrNull;
    if (user == null) return null;
    
    try {
      return await ref.read(authRepositoryProvider).getUserAccounts();
    } catch (e) {
      return null;
    }
  }
  
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final accounts = await ref.read(authRepositoryProvider).getUserAccounts();
      state = AsyncValue.data(accounts);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
  
  Future<void> switchAccount(String accountId) async {
    try {
      await ref.read(authRepositoryProvider).switchAccount(accountId);
      // Refresh account list and invalidate dependent providers
      await refresh();
      ref.invalidate(currentAccountIdProvider);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> createAccount(Map<String, dynamic> data) async {
    try {
      await ref.read(authRepositoryProvider).createAccount(data);
      // Refresh to show the new account
      await refresh();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

@riverpod
Future<String?> currentAccountId(CurrentAccountIdRef ref) async {
  // Try to get from JWT token first
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token != null) {
      final accountId = _extractAccountIdFromToken(token);
      if (accountId != null) {
        return accountId;
      }
    }
  } catch (e) {
    // Ignore errors
  }
  
  // Fallback: get from first account
  final accounts = ref.watch(accountNotifierProvider).valueOrNull;
  return accounts?.isNotEmpty == true ? accounts!.first.id : null;
}

String? _extractAccountIdFromToken(String token) {
  try {
    // JWT tokens have 3 parts separated by dots: header.payload.signature
    final parts = token.split('.');
    if (parts.length != 3) return null;
    
    // Decode the payload (second part) - base64url decode
    final payload = parts[1];
    
    // Base64URL decode
    String normalized = payload.replaceAll('-', '+').replaceAll('_', '/');
    switch (normalized.length % 4) {
      case 1:
        normalized += '===';
        break;
      case 2:
        normalized += '==';
        break;
      case 3:
        normalized += '=';
        break;
    }
    
    // Decode base64
    final decodedBytes = base64Decode(normalized);
    final decoded = utf8.decode(decodedBytes);
    
    // Parse JSON and extract account_id
    final jsonMap = jsonDecode(decoded) as Map<String, dynamic>;
    return jsonMap['account_id'] as String?;
  } catch (e) {
    return null;
  }
}
