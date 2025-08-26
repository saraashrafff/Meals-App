class MealModel {
  String mealName;
  String mealCalories;
  String mealImageUrl;
  String mealDescription;
  String mealRating;
  String mealCookingTime;

  MealModel({
    required this.mealName,
    required this.mealCalories,
    required this.mealImageUrl,
    required this.mealDescription,
    required this.mealRating,
    required this.mealCookingTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'mealName': mealName,
      'mealImageUrl': mealImageUrl,
      'mealDescription': mealDescription,
      'mealCalories': mealCalories,
      'mealCookingTime': mealCookingTime,
      'mealRating': mealRating,
    };
  }

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      mealName: json['mealName'],
      mealImageUrl: json['mealImageUrl'],
      mealDescription: json['mealDescription'],
      mealCalories: json['mealCalories'],
      mealCookingTime: json['mealCookingTime'],
      mealRating: json['mealRating'],
    );
  }
}

// class MealModel {
//   String mealName;
//   String mealCalories;
//   String mealImageName;
//   String mealDescription;
//   String mealRating;
//   String mealCookingTime;

//   MealModel({
//     required this.mealName,
//     required this.mealCalories,
//     required this.mealImageName,
//     required this.mealDescription,
//     required this.mealRating,
//     required this.mealCookingTime,
//   });

//   static List<String> mealsNames = [
//     'Breakfast Smoothie',
//     'Chicken Salad',
//     'Vegetable Soup',
//     'Breakfast Smoothie',
//     'Chicken Salad',
//     'Vegetable Soup',
//     'Breakfast Smoothie',
//     'Chicken Salad',
//     'Vegetable Soup',
//   ];

//   static List<String> mealsCalories = [
//     '350',
//     '600',
//     '400',
//     '350',
//     '600',
//     '400',
//     '350',
//     '600',
//     '400',
//   ];

//   static List<String> mealsImageName = [
//     'smoothie',
//     'chicken',
//     'soup',
//     'smoothie',
//     'chicken',
//     'soup',
//     'smoothie',
//     'chicken',
//     'soup',
//   ];

//   static List<String> mealsDescriptions = [
//     'A refreshing smoothie made with fruits and yogurt to kickstart your day.',
//     'A healthy salad with grilled chicken, fresh veggies, and light dressing.',
//     'A warm vegetable soup packed with nutrients and flavor.',
//     'A refreshing smoothie made with fruits and yogurt to kickstart your day.',
//     'A healthy salad with grilled chicken, fresh veggies, and light dressing.',
//     'A warm vegetable soup packed with nutrients and flavor.',
//     'A refreshing smoothie made with fruits and yogurt to kickstart your day.',
//     'A healthy salad with grilled chicken, fresh veggies, and light dressing.',
//     'A warm vegetable soup packed with nutrients and flavor.',
//   ];

//   static List<String> mealsRatings = [
//     '5.0',
//     '4.2',
//     '3.7',
//     '5.0',
//     '4.2',
//     '3.7',
//     '5.0',
//     '4.2',
//     '3.7',
//   ];

//   static List<String> mealsCookingTimes = [
//     '5 - 10',
//     '15 - 20',
//     '20 - 30',
//     '5 - 10',
//     '15 - 20',
//     '20 - 30',
//     '5 - 10',
//     '15 - 20',
//     '20 - 30',
//   ];

//   static List<MealModel> meals = List.generate(
//     mealsNames.length,
//     (index) => MealModel(
//       mealName: mealsNames[index],
//       mealCalories: mealsCalories[index],
//       mealImageName: mealsImageName[index],
//       mealDescription: mealsDescriptions[index],
//       mealRating: mealsRatings[index],
//       mealCookingTime: mealsCookingTimes[index],
//     ),
//   );
// }
