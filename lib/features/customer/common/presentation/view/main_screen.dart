import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/features/customer/categories/presentation/view/categories_screen.dart';
import 'package:consultant_customer_app/features/customer/home/home/presentation/view/home_screen.dart';
import 'package:consultant_customer_app/features/customer/message/presentation/view/message_screen.dart';
import 'package:consultant_customer_app/features/customer/my_consult/presentation/view/my_consult_screen.dart';
import 'package:consultant_customer_app/features/customer/profile/presentation/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({super.key});

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    CategoriesScreen(),
    MyConsultScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 85.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, -1.0),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: .fixed,
        items: [
          _navItem(SvgAssets.home, 'Home'),
          _navItem(SvgAssets.categories, 'Categories'),
          _navItem(SvgAssets.calendarCheck, 'My Consult'),
          _navItem(SvgAssets.message, 'Message'),
          _navItem(SvgAssets.profile, 'Profile'),
        ],

        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: context.colorScheme.primary,
        selectedLabelStyle: context.textTheme.labelLarge?.copyWith(
          fontSize: 12.0,
          color: context.colorScheme.primary,
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: context.textTheme.labelMedium?.copyWith(
          fontSize: 12.0,
          color: Colors.grey,
        ),
        onTap: _onItemTapped,
        elevation: 0.0,
      ),
    );
  }

  BottomNavigationBarItem _navItem(String assetName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetName,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        assetName,
        colorFilter: ColorFilter.mode(
          context.colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
