import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whattoeat/components/rounded_button.dart';
import 'package:whattoeat/screens/meal_main_screen.dart';
import '../utilities/constants.dart';

class GenerateMealScreen extends StatefulWidget {
  @override
  _GenerateMealScreenState createState() => _GenerateMealScreenState();
}

class _GenerateMealScreenState extends State<GenerateMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Meal'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/hungry.png',
                height: 200,
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Do You Feel Hungry?',
                style: kLabelTextStyle2,
              ),
              RoundedButton(
                  color: Colors.blueAccent,
                  title: 'Generate a Meal',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
