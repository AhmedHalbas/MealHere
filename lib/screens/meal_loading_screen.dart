import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whattoeat/screens/meal_navigator_screen.dart';
import 'package:whattoeat/screens/meal_search_screen.dart';
import '../components/internet_connection.dart';
import '../services/networking.dart';
import '../services/meal.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<Meal> meals = [];
  String APIURL = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';
  List<String> mealsNames = [];

  void getMeals() async {
    meals = await NetworkHelper(APIURL).getData();

    for (int i = 0; i < meals.length; i++) {
      mealsNames.add(meals[i].mealName);
    }

    checkInternet(context, meals);

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return NavigatorScreen(
        mealsNames: mealsNames,
      );
    }), (_) => false);
  }

  @override
  void initState() {
    super.initState();
    getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.blue,
          size: 80,
        ),
      ),
    );
  }
}
