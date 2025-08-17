import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/app_colors.dart';

// ignore: must_be_immutable
class ActiveIcon extends StatelessWidget {
  String iconName;

  ActiveIcon({super.key, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      height: 26,
      width: 26,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
    );
  }
}
