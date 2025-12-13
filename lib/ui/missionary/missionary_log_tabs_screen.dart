import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'missionary_log_impact_screen.dart';
import 'missionary_log_expense_screen.dart';

class MissionaryLogTabsScreen extends StatefulWidget {
  const MissionaryLogTabsScreen({Key? key}) : super(key: key);

  @override
  State<MissionaryLogTabsScreen> createState() =>
      _MissionaryLogTabsScreenState();
}

class _MissionaryLogTabsScreenState extends State<MissionaryLogTabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Activity'),
        backgroundColor: AppColors.missionaryPrimary,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Impact', icon: Icon(Icons.favorite)),
            Tab(text: 'Expense', icon: Icon(Icons.attach_money)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MissionaryLogImpactScreen(),
          MissionaryLogExpenseScreen(),
        ],
      ),
    );
  }
}

