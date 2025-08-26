import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/database/dp_helper.dart';
import 'package:meals_app/widgets/meal_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  List<String> headerImageNames = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: headerImageNames.length,
          itemBuilder: (_, int index, _) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/header${headerImageNames[index]}.png',
                  height: screenSize.height * 0.2,
                  width: screenSize.width,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 7,
                  right: 10,
                  left: 10,
                  child: DotsIndicator(
                    dotsCount: headerImageNames.length,
                    position: currentIndex.toDouble(),
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
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
                      activeColor: AppColor.primary,
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            height: screenSize.height * 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'My Meals',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: FutureBuilder(
            future: DatabaseHelper.instance.getMeals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No meals found"));
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                final meals = snapshot.data!;
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (_, index) => MealItem(meal: meals[index]),
                  separatorBuilder: (_, _) => SizedBox(height: 8),
                  itemCount: meals.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
