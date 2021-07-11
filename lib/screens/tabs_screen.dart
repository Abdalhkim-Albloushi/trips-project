import 'package:flutter/material.dart';
import '../widget/app_drawer.dart';
import '../screens/categories.dart';
import '../screens/favorites_screen.dart';

class TapsScreen extends StatefulWidget {
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  int _selectIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {
      'Screen': CategoriesScreen(),
      'Title': 'التصنيفات',
    },
    {
      'Screen': FavritScreen(),
      'Title': 'المفضلة',
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(_screens[_selectIndex]['Title'].toString()),
      ),
      body: _screens[_selectIndex]['Screen'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ),
    );
  }
}
