import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/app_colors.dart';

// ignore: must_be_immutable
class InactiveIcon extends StatelessWidget {
  String iconName;

  InactiveIcon({super.key, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      height: 22,
      width: 22,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(AppColor.black, BlendMode.srcIn),
    );
  }
}
