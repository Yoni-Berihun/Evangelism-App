import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/account_provider.dart';

class AccountSwitcher extends ConsumerWidget {
  const AccountSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountNotifierProvider);
    final currentAccountIdAsync = ref.watch(currentAccountIdProvider);

    return accounts.when(
      data: (accountList) {
        if (accountList == null || accountList.isEmpty) {
          return const SizedBox.shrink();
        }

        if (accountList.length == 1) {
          // Single account - show account name
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              accountList.first.accountName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          );
        }

        // Multiple accounts - show dropdown
        return currentAccountIdAsync.when(
          data: (currentAccountId) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<String>(
                value: currentAccountId,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                dropdownColor: Colors.white,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                ),
                items: accountList.map((account) {
                  return DropdownMenuItem(
                    value: account.id,
                    child: Text(
                      account.accountName,
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                  );
                }).toList(),
                onChanged: (accountId) {
                  if (accountId != null && accountId != currentAccountId) {
                    ref.read(accountNotifierProvider.notifier).switchAccount(accountId);
                  }
                },
              ),
            );
          },
          loading: () => const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (_, __) => const SizedBox.shrink(),
        );
      },
      loading: () => const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
