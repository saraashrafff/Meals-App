import 'package:flutter/material.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/nav_bar.dart/active_icon.dart';
import 'package:meals_app/nav_bar.dart/inactive_icon.dart';
import 'package:meals_app/tabs/add_meal_tab.dart';
import 'package:meals_app/tabs/home_tab.dart';
import 'package:meals_app/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), AddMealTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          currentIndex == 0
              ? 'My Meals'
              : currentIndex == 1
              ? 'Add Meal'
              : 'My Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.black,
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: InactiveIcon(iconName: 'home'),
            activeIcon: ActiveIcon(iconName: 'home'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(iconName: 'add'),
            activeIcon: ActiveIcon(iconName: 'add'),
            label: 'Add Meal',
          ),
          BottomNavigationBarItem(
            icon: InactiveIcon(iconName: 'profile'),
            activeIcon: ActiveIcon(iconName: 'profile'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
