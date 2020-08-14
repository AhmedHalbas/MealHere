import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whattoeat/screens/meal_specific_screen.dart';
import '../components/reusable_card.dart';
import '../utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MealListItem extends StatelessWidget {
  final String mealName;
  final String mealImage;

  MealListItem({this.mealName, this.mealImage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ReusableCard(
        colour: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpecificScreen(
                selectedMeal: mealName,
              ),
            ),
          );
        },
        cardChild: Column(
          children: <Widget>[
            mealImage != null && Uri.parse(mealImage).isAbsolute
                ? Image.network(
                    mealImage,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    },
                  )
                : Image.asset('images/no_image_available.png'),
            SizedBox(height: 30),
            Text(
              mealName,
              style: kLabelTextStyle2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
