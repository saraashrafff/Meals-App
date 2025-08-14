class OnboardingModel {
  int index;
  String title;
  String description;
  OnboardingModel({
    required this.title,
    required this.description,
    required this.index,
  });
}

List<String> titles = [
  "save_your_meals_ingredient",
  "use_our_app_the_best_choice",
  "our_app_your_ultimate_choice",
];
List<String> descriptions = [
  "add_your_meals_and_its_ingredients_and_we_will_save_it_for_you",
  "the_best_choice_for_your_kitchen_do_not_hesitate",
  "all_the_best_restaurants_and_their_top_menus_are_ready_for_you",
];

List<OnboardingModel> onboardingScreens = List.generate(
  titles.length,
  (index) => OnboardingModel(
    title: titles[index],
    description: descriptions[index],
    index: index,
  ),
);
