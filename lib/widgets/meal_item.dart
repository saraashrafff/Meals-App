import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/app_colors.dart';
import 'package:meals_app/meal_details_screen.dart';
import 'package:meals_app/models/meal_model.dart';

// ignore: must_be_immutable
class MealItem extends StatelessWidget {
  MealModel meal;
  MealItem({super.key, required this.meal});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(MealDetailsScreen.routeName, arguments: meal);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
            imageUrl: meal.mealImageUrl,
            placeholder: (context, url) =>
                Container(decoration: BoxDecoration(color: AppColor.grey)),
            errorWidget: (context, url, error) => Icon(Icons.error),
              height: screenSize.height * 0.08,
              width: screenSize.height * 0.08,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.mealName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
              ),
              Text(
                ' ${meal.mealCalories} Calories',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
