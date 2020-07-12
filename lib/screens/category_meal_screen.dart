import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';

 
class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/CategoryMealScreen';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _isLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    final categoryID = routeArg['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    _isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
     displayedMeals.removeWhere((meal) =>
       meal.id == mealId
     );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                duration: displayedMeals[index].duration);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
