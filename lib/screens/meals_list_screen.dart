import 'package:flutter/material.dart';
import 'package:whattoeat/components/meal_list_item.dart';
import '../services/networking.dart';
import '../services/meal.dart';
import '../components/internet_connection.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool showSpinner = false;
  Text title;
  List<Meal> meals = [];

  void getData() async {
    setState(() {
      showSpinner = true;
    });

    meals = await NetworkHelper(
            'https://www.themealdb.com/api/json/v1/1/search.php?s=')
        .getData();

    checkInternet(context, meals);

    setState(() {
      showSpinner = false;
    });

    setState(() {
      title = Text('Meals List');
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
        title: title,
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showSpinner,
        child: ListView.separated(
            separatorBuilder: (context, position) => Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
            itemCount: meals.length,
            itemBuilder: (context, position) {
              return MealListItem(
                mealName: meals[position].mealName,
                mealImage: meals[position].mealImage,
              );
            }),
      ),
    );
  }
}
