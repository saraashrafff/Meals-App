import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/features/onboarding/onboarding_item.dart';

class OnboardingModel extends StatefulWidget {
  int index;
  VoidCallback? onTap;
  OnboardingModel({super.key, required this.index, required this.onTap});

  @override
  State<OnboardingModel> createState() => _OnboardingModelState();
}

class _OnboardingModelState extends State<OnboardingModel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          onboardingScreens[widget.index].title.tr(),
          style: TextStyle(
            fontSize: 30.sp,
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          onboardingScreens[widget.index].description.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
