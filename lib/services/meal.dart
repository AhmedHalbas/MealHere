class Meal {
  final String mealName;
  final String mealCategory;
  final String mealArea;
  final String mealInstructions;
  final String mealImage;
  final String mealYoutube;

  Meal(
      {this.mealName,
      this.mealCategory,
      this.mealArea,
      this.mealInstructions,
      this.mealImage,
      this.mealYoutube});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      mealName: json['strMeal'],
      mealCategory: json['strCategory'],
      mealArea: json['strArea'],
      mealInstructions: json['strInstructions'],
      mealImage: json['strMealThumb'],
      mealYoutube: json['strYoutube'],
    );
  }
}
