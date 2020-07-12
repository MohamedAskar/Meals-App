import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favorites;

  FavoriteScreen(this.favorites);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorites.isEmpty) {
      return Center(
        child: Text("You have no Favorites yet! - Start adding some"),
      );
    }
    else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: widget.favorites[index].id,
                title: widget.favorites[index].title,
                imageUrl: widget.favorites[index].imageUrl,
                affordability: widget.favorites[index].affordability,
                complexity: widget.favorites[index].complexity,
                duration: widget.favorites[index].duration,);
          },
          itemCount: widget.favorites.length,
        );
    }
  }
}
