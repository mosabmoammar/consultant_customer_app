import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/widgets/custom_tab_bar.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/widgets/wallet_widget.dart';
import '../../../consultant_tab/presentation/view/consultant_tap_screen.dart';
import '../../../following_tab/presentation/view/following_tap_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.dragDetails != null) {
                FocusScope.of(context).unfocus();
              }
              return false;
            },
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: UserHomeHeader(name: 'Jhon Doe'),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomTextField(
                        hintText: 'Search for Consultant',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomTabBar(
                          controller: _tabController,
                          firstNameTab: 'Consultant',
                          secondNameTab: 'Following',
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: HomeTabs(controller: _tabController),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeTabs extends StatelessWidget {
  final TabController controller;
  const HomeTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: const [ConsultantTapScreen(), FollowingTapScreen()],
    );
  }
}

class UserHomeHeader extends StatelessWidget {
  final String name;
  const UserHomeHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Texts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: context.textTheme.bodyMedium?.copyWith(letterSpacing: 0.0),
            ),
            Text(
              'Find your Consultant',
              style: context.textTheme.headlineMedium?.copyWith(height: 1),
            ),
          ],
        ),

        // Icons
        Row(
          children: [
            const WalletWidget(amount: 100.0),

            const SizedBox(width: 4.0),

            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print('Notification Tap');
                }
              },
              borderRadius: BorderRadius.circular(100.0),
              child: Ink(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Icon(Icons.notifications_outlined, size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
