import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/features/home/home_screen.dart';
import 'package:meals_app/features/onboarding/onboarding_iteml.dart';
import 'package:meals_app/features/onboarding/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding-screen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  CarouselSliderController sliderController = CarouselSliderController();
  Locale currentLocale = Locale('en');

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            height: screenSize.height,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 30.h,
            right: 30.w,
            left: 30.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: screenSize.height * 0.5,
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: sliderController,
                    itemCount: onboardingScreens.length,
                    itemBuilder: (_, int index, _) {
                      return OnboardingItem(index: index);
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 250.h,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: titles.length,
                    position: currentIndex.toDouble(),
                    onTap: (index) {
                      sliderController.animateToPage(index);
                    },
                    decorator: DotsDecorator(
                      size: Size(20.w, 6.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      color: AppColor.grey,
                      activeSize: Size(20.w, 6.h),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      activeColor: AppColor.white,
                    ),
                  ),
                  Spacer(),
                  currentIndex < 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed(HomeScreen.routeName);
                              },
                              child: Text(
                                'skip'.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                sliderController.nextPage();
                              },
                              child: Text(
                                'next'.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(HomeScreen.routeName);
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            radius: 30.r,
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30.w,
            right: 30.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary.withOpacity(0.9),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                changeLanguage();
              },
              child: Text(
                context.locale.languageCode == 'en' ? 'English' : 'العربية',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLanguage() {
    if (context.locale == Locale('en')) {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }
}
