import 'package:flutter/material.dart';
import 'package:whattoeat/screens/meal_main_screen.dart';
import '../components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import '../components/alert_dialog.dart';
import 'meal_specific_screen.dart';

class SearchScreen extends StatefulWidget {
  List<String> mealsNames = [];
  SearchScreen({this.mealsNames});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedMeal;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'images/hungry.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            SimpleAutoCompleteTextField(
              controller: _controller,
              key: key,
              suggestions: widget.mealsNames,
              clearOnSubmit: false,
              textSubmitted: (text) => setState(() {
                selectedMeal = text;
              }),
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Meal Name',
                focusColor: Colors.blue,
                //fillColor: Colors.blue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Search',
              onPressed: () {
                if (selectedMeal == null) {
                  showAlertDialog(context,
                      isDismissible: true,
                      title: 'Meal Name Issue',
                      content: 'Please Enter Meal Name Properly',
                      buttonText: 'Ok', onPressed: () {
                    Navigator.pop(context);
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecificScreen(
                        selectedMeal: selectedMeal,
                      ),
                    ),
                  ).then(
                    (_) => {
                      selectedMeal = null,
                      _controller.clear(),
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
