import '../api/auth_api.dart';
import '../../models/user.dart';
import '../../models/account.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<User> login(String email, String password) async {
    final data = await _authApi.login(email, password);
    // Backend returns AuthResponse with nested user object
    if (data.containsKey('user')) {
      return User.fromJson(data['user'] as Map<String, dynamic>);
    }
    throw Exception('Invalid response format: user not found');
  }

  Future<User> register(Map<String, dynamic> userData) async {
    final data = await _authApi.register(userData);
    // Backend returns AuthResponse with nested user object
    if (data.containsKey('user')) {
      return User.fromJson(data['user'] as Map<String, dynamic>);
    }
    throw Exception('Invalid response format: user not found');
  }

  Future<User> getCurrentUser() async {
    return await _authApi.getCurrentUser();
  }

  Future<void> logout() async {
    await _authApi.logout();
  }

  Future<List<Account>> getUserAccounts() async {
    final data = await _authApi.getUserAccounts();
    return data.map((json) => Account.fromJson(json)).toList();
  }

  Future<void> switchAccount(String accountId) async {
    await _authApi.switchAccount(accountId);
  }

  Future<Account> createAccount(Map<String, dynamic> data) async {
    final response = await _authApi.createAccount(data);
    return Account.fromJson(response);
  }
}

