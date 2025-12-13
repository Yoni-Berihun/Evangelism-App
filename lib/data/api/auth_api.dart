import '../api_client.dart';
import '../../models/user.dart';

class AuthApi {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data as Map<String, dynamic>;
      
      // Store token
      if (data.containsKey('access_token')) {
        await _apiClient.setAuthToken(data['access_token']);
      }

      return data;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<User> register(Map<String, dynamic> userData) async {
    try {
      final response = await _apiClient.dio.post(
        '/auth/register',
        data: userData,
      );
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _apiClient.dio.get('/auth/me');
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _apiClient.dio.post('/auth/logout');
    } catch (e) {
      // Ignore logout errors
    } finally {
      await _apiClient.clearAuthToken();
    }
  }
}

