import 'package:flutter/material.dart';
import 'package:meals_app/core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('home', style: TextStyle(color: AppColor.black))],
        ),
      ),
    );
  }
}
