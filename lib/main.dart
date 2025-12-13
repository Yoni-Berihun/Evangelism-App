import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'ui/dashboard/admin_dashboard.dart';
import 'ui/dashboard/missionary_dashboard.dart';
import 'ui/auth/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: CMOMSApp()));
}

class CMOMSApp extends StatelessWidget {
  const CMOMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMOMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const RootScreen(),
    );
  }
}

/// RootScreen decides whether to show Login or Dashboard based on auth state
class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    if (user == null) {
      return const LoginScreen();
    }

    // Role-based navigation
    if (user.role == "admin") {
      return const AdminDashboard();
    } else {
      return const MissionaryDashboard();
    }
  }
}