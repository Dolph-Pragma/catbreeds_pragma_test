import 'dart:async';

import '../models/favorite_cat_model.dart';
import '../provider/cats_api_provider.dart';

class CatFavoriteBloc {
  static final CatFavoriteBloc _instance = CatFavoriteBloc._internal();

  CatFavoriteBloc._internal();

  factory CatFavoriteBloc() {
    return _instance;
  }

  final CatsApiProvider catsApiProvider = CatsApiProvider();
  List<FavoriteCatModel> favoriteCats = [];

  final _favoriteCatController =
      StreamController<List<FavoriteCatModel>>.broadcast();

  Stream<List<FavoriteCatModel>> get streamFavoriteCats =>
      _favoriteCatController.stream;

  Future<void> getFavorites() async {
    favoriteCats = await catsApiProvider.getFavorites();
    _favoriteCatController.add(favoriteCats);
  }

  Future<void> postFavoriteCat(String catImageId) async {
    await catsApiProvider.postFavoriteCat(catImageId);
    await getFavorites();
  }

  Future<void> deleteCatFromFavorites(int catFavoriteId) async {
    await catsApiProvider.deleteCatFromFavorites(catFavoriteId);
    await getFavorites();
  }

  bool isCatInFavorites(String? catImageId) {
    return favoriteCats.any((element) => element.imageId == catImageId);
  }

  int searchFavoriteFromCatModel(String catImageId) {
    FavoriteCatModel favCat =
        favoriteCats.firstWhere((element) => element.imageId == catImageId);
    return favCat.id;
  }

  bool updateFavoriteCat(String catImageId) {
    if (isCatInFavorites(catImageId)) {
      int favoriteCatId = searchFavoriteFromCatModel(catImageId);
      deleteCatFromFavorites(favoriteCatId);
      return false;
    } else {
      postFavoriteCat(catImageId);
      return true;
    }
  }
}
