import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String role;
  User(this.role);
}

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  Future<void> login(String email, String password) async {
    // For demo: always log in as admin if email contains "admin"
    if (email.contains("admin")) {
      state = User("admin");
    } else {
      state = User("missionary");
    }
  }

  void logout() {
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});