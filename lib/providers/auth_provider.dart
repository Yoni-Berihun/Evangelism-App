import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api/api_client.dart';
import '../data/api/auth_api.dart';
import '../data/repositories/auth_repository.dart';
import '../models/user.dart';

part 'auth_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient();
}

@riverpod
AuthApi authApi(AuthApiRef ref) {
  return AuthApi(ref.watch(apiClientProvider));
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(authApiProvider));
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<User?> build() async {
    await _checkAuthStatus();
    return state.valueOrNull;
  }

  Future<void> _checkAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token != null) {
        try {
          final user = await ref.read(authRepositoryProvider).getCurrentUser();
          state = AsyncValue.data(user);
        } catch (e) {
          state = const AsyncValue.data(null);
        }
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e) {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await ref.read(authRepositoryProvider).login(email, password);
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> register(Map<String, dynamic> userData) async {
    state = const AsyncValue.loading();
    try {
      final user = await ref.read(authRepositoryProvider).register(userData);
      state = AsyncValue.data(user);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await ref.read(authRepositoryProvider).logout();
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void setRole(String role) {
    // Demo function - in production, role comes from backend
    final currentUser = state.valueOrNull;
    if (currentUser != null) {
      state = AsyncValue.data(
        currentUser.copyWith(role: role),
      );
    }
  }
}

@riverpod
String? userRole(UserRoleRef ref) {
  final authState = ref.watch(authNotifierProvider);
  return authState.valueOrNull?.role; // 'admin' or 'missionary'
}

@riverpod
String currentAccountId(CurrentAccountIdRef ref) {
  // Get current account ID from user's account mapping
  // For demo, return default account
  // In production, get from user's account relationship
  return 'default_account_id';
}
