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
          Image.asset(
            'assets/images/${meal.mealImageName}.png',
            height: screenSize.height * 0.1,
            width: screenSize.height * 0.1,
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
