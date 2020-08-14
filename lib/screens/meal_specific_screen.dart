import 'package:flutter/material.dart';
import 'package:whattoeat/services/meal.dart';
import '../services/networking.dart';
import '../components/internet_connection.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../components/meal_item.dart';

class SpecificScreen extends StatefulWidget {
  String selectedMeal;
  SpecificScreen({this.selectedMeal});
  @override
  _SpecificScreenState createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  bool showSpinner = false;
  var deathPercentage;
  Text title;
  List<Meal> meals = [];

  void getData() async {
    setState(() {
      showSpinner = true;
    });

    meals = await NetworkHelper(
            'https://www.themealdb.com/api/json/v1/1/search.php?s=${widget.selectedMeal}')
        .getData();

    checkInternet(context, meals);

    setState(() {
      showSpinner = false;
    });

    setState(() {
      title = Text('${meals[0].mealName} Recipe');
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(fit: BoxFit.fill, child: title),
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showSpinner,
        child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (BuildContext context, int position) {
              return new MealItem(
                mealName: meals[position].mealName,
                mealCategory: meals[position].mealCategory,
                mealImage: meals[position].mealImage,
                mealArea: meals[position].mealArea,
                mealInstructions: meals[position].mealInstructions,
                mealYoutube: meals[position].mealYoutube,
              );
            }),
      ),
    );
  }
}
