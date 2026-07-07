import 'package:consultant_customer_app/features/notification/presentation/view/tabs_notifications/all_tab/presentation/view/all_tab.dart';
import 'package:consultant_customer_app/features/notification/presentation/view/tabs_notifications/payment_tab/presentation/view/payment_tab.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/custom_tab_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
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
      appBar: const CustomAppBar(title: 'Notification'),
      body: SafeArea(
        child: Column(
          children: [
            // Tabs
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: CustomTabBar(
                controller: _tabController,
                firstNameTab: 'All',
                secondNameTab: 'Payment',
              ),
            ),

            //Tab Bar View
            Expanded(
              child: _NotificationTabBarView(controller: _tabController),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTabBarView extends StatelessWidget {
  final TabController controller;
  const _NotificationTabBarView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: const [AllTab(), PaymentTab()],
    );
  }
}
