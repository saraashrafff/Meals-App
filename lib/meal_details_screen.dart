import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal-details';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'Meal Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: meal.mealImageUrl,
            placeholder: (context, url) =>
                Container(decoration: BoxDecoration(color: AppColor.grey)),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: screenSize.height * 0.35,
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.mealName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.primary.withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/time.svg'),
                      SizedBox(width: 8),
                      Text(
                        meal.mealCookingTime,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.darkGrey,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SizedBox(width: 8),
                      Text(
                        meal.mealRating,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  meal.mealDescription,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
