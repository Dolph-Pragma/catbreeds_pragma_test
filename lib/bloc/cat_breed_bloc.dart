import 'dart:async';

import '../models/cat_model.dart';
import '../provider/cats_api_provider.dart';

class CatBreedBloc {
  static final CatBreedBloc _instance = CatBreedBloc._internal();

  factory CatBreedBloc() {
    return _instance;
  }

  CatBreedBloc._internal();

  CatsApiProvider catsProvider = CatsApiProvider();
  StreamController<List<CatModel>> catBreedController =
      StreamController.broadcast();

  List<CatModel> cats = [];

  Future<void> getCats() async {
    cats = await catsProvider.getCats();
    catBreedController.add(cats);
  }
}
