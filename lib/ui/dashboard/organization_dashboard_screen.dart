import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../models/account.dart';
import '../../providers/account_provider.dart';
import '../../providers/auth_provider.dart';
import '../../main.dart'; // For MissionaryDashboard
import '../admin/admin_dashboard.dart'; // For AdminDashboard
import '../admin/admin_home_screen.dart'; // For AdminHomeScreen
import 'create_organization_screen.dart';

class OrganizationDashboardScreen extends ConsumerWidget {
  const OrganizationDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountNotifierProvider);
    final user = ref.watch(authNotifierProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Church'),
        backgroundColor: AppColors.adminPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(accountNotifierProvider.notifier).refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: accountState.when(
        data: (accounts) {
          if (accounts == null || accounts.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildAccountList(context, ref, accounts, user?.role);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateOrganizationScreen(),
              ),
            );
        },
        label: const Text('Create Church'),
        icon: const Icon(Icons.add),
        backgroundColor: AppColors.adminPrimary,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.church_outlined, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'No Churches Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'You are not linked to any church yet.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
               Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateOrganizationScreen(),
              ),
            );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.adminPrimary,
            ),
            child: const Text('Create New Church'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountList(BuildContext context, WidgetRef ref,
      List<Account> accounts, String? userRole) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              _onAccountSelected(context, ref, account, userRole);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.adminPrimary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        account.accountName.isNotEmpty
                            ? account.accountName[0].toUpperCase()
                            : 'C',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.adminPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          account.accountName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              account.location ?? 'No location',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: (userRole == 'missionary'
                              ? AppColors.missionaryPrimary
                              : AppColors.adminPrimary)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      userRole?.toUpperCase() ?? 'MEMBER',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: userRole == 'missionary'
                            ? AppColors.missionaryPrimary
                            : AppColors.adminPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.grey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onAccountSelected(BuildContext context, WidgetRef ref, Account account,
      String? userRole) async {
    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Set the current account context
      await ref.read(accountNotifierProvider.notifier).switchAccount(account.id);
      
      // Refresh user profile to get role in new context
      final newUser = await ref.refresh(authNotifierProvider.future);
      
      if (!context.mounted) return;
      Navigator.pop(context); // Dismiss loading overlay

      // Navigate based on fresh role
      final role = newUser?.role;
      
      if (role == 'missionary') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MissionaryDashboard()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AdminDashboard(account: account),
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pop(context); // Dismiss loading overlay
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to enter church context: $e'),
          backgroundColor: AppColors.red,
        ),
      );
    }
  }
}
