import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MealItem extends StatelessWidget {
  final String mealName;
  final String mealCategory;
  final String mealArea;
  final String mealInstructions;
  final String mealImage;
  final String mealYoutube;

  MealItem(
      {this.mealName,
      this.mealCategory,
      this.mealArea,
      this.mealInstructions,
      this.mealImage,
      this.mealYoutube});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          ReusableCard(
            colour: Colors.blue,
            cardChild: Text(
              'Name: $mealName',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ReusableCard(
            colour: Colors.blue,
            cardChild: Text(
              'Category: $mealCategory',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ReusableCard(
            colour: Colors.blue,
            cardChild: Text(
              'Area: $mealArea',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ReusableCard(
            colour: Colors.blue,
            cardChild: Text(
              'Recipe: $mealInstructions',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          ReusableCard(
            colour: Colors.blue,
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Watch on YouTube: ',
                  style: kLabelTextStyle,
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  child: Image.asset(
                    'images/youtube_icon.webp',
                    width: 50,
                    height: 50,
                  ),
                  onPressed: () {
                    launch(mealYoutube);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
