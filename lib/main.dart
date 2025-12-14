import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'models/account.dart';
import 'providers/auth_provider.dart';
import 'ui/auth/login_screen.dart';
import 'ui/admin/admin_home_screen.dart';
import 'ui/admin/admin_add_mission_screen.dart';
import 'ui/admin/admin_analysis_screen.dart';
import 'ui/admin/admin_profile_screen.dart';
import 'ui/admin/admin_missionaries_screen.dart';
import 'ui/missionary/missionary_home_screen.dart';
import 'ui/missionary/missionary_log_tabs_screen.dart';
import 'ui/missionary/missionary_analysis_screen.dart';
import 'ui/missionary/missionary_profile_screen.dart';
import 'ui/dashboard/organization_dashboard_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CMOMSApp(),
    ),
  );
}

class CMOMSApp extends StatelessWidget {
  const CMOMSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMOMS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const RoleSwitchWrapper(),
    );
  }
}

class RoleSwitchWrapper extends ConsumerWidget {
  const RoleSwitchWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const LoginScreen();
        }

        // New Flow: Dashboard with list of churches
        return const OrganizationDashboardScreen();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}



class MissionaryDashboard extends StatefulWidget {
  const MissionaryDashboard({Key? key}) : super(key: key);

  @override
  State<MissionaryDashboard> createState() => _MissionaryDashboardState();
}

class _MissionaryDashboardState extends State<MissionaryDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MissionaryHomeScreen(),
    const MissionaryLogTabsScreen(),
    const MissionaryAnalysisScreen(),
    const MissionaryProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.missionaryPrimary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Log'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Analysis'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
