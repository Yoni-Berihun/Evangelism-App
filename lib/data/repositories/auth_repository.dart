import '../api/auth_api.dart';
import '../../models/user.dart';

class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<User> login(String email, String password) async {
    final data = await _authApi.login(email, password);
    // Assuming the API returns user data in the response
    return User.fromJson(data['user'] ?? data);
  }

  Future<User> register(Map<String, dynamic> userData) async {
    return await _authApi.register(userData);
  }

  Future<User> getCurrentUser() async {
    return await _authApi.getCurrentUser();
  }

  Future<void> logout() async {
    await _authApi.logout();
  }
}

