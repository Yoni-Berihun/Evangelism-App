import 'api_client.dart';
import '../../models/user.dart';
import '../../core/constants/api_constants.dart';

class AuthApi {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data as Map<String, dynamic>;
      
      // Store tokens
      if (data.containsKey('access_token') && data.containsKey('refresh_token')) {
        await _apiClient.setAuthTokens(
          data['access_token'] as String,
          data['refresh_token'] as String,
        );
      }

      return data;
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.register,
        data: userData,
      );

      final data = response.data as Map<String, dynamic>;
      
      // Store tokens
      if (data.containsKey('access_token') && data.containsKey('refresh_token')) {
        await _apiClient.setAuthTokens(
          data['access_token'] as String,
          data['refresh_token'] as String,
        );
      }

      return data;
    } catch (e) {
      throw Exception('Failed to register: ${e.toString()}');
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _apiClient.dio.get(ApiConstants.me);
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get current user: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    try {
      await _apiClient.dio.post(ApiConstants.logout);
    } catch (e) {
      // Ignore logout errors
    } finally {
      await _apiClient.clearAuthTokens();
    }
  }
}

