import 'package:flutter/material.dart';
import 'package:meals/screens/Favorite_screen.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState () {
    _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoritesMeals), 'title': 'Your Favorites'}
  ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'], style: Theme.of(context).textTheme.title)),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites'))
        ],
      ),
      drawer: MainDrawer()
    );
  }
}
