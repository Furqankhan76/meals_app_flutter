import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealsProvider extends StateNotifier<List<Meal>> {
  FavoritesMealsProvider() : super([]);
  bool toggleMealFavorites(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsProvider, List<Meal>>((ref) {
  return FavoritesMealsProvider();
});
