import 'package:flutter/material.dart';
import 'package:whattoeat/screens/meal_search_screen.dart';
import 'dart:io';
import '../screens/meal_generate_screen.dart';
import '../screens/meals_list_screen.dart';

class NavigatorScreen extends StatefulWidget {
  List<String> mealsNames = [];
  NavigatorScreen({this.mealsNames});

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _index = 0;
  final globalKey = GlobalKey<ScaffoldState>();

  void checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('There is an Internet Connection');
      }
    } on SocketException catch (_) {
      _showToast(context);
    }
  }

  void _showToast(BuildContext context) {
    globalKey.currentState.showSnackBar(
      SnackBar(
        content: Text('No Internet Connection'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = SearchScreen(
          mealsNames: widget.mealsNames,
        );
        break;
      case 1:
        child = GenerateMealScreen();
        break;
      case 2:
        child = ListScreen();
        break;
    }
    return Scaffold(
      key: globalKey,
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            title: Text("Random"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            title: Text("List"),
          ),
        ],
      ),
    );
  }
}
