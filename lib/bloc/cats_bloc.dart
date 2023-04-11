import 'dart:async';

import '../models/model_gatitos.dart';
import '../provider/cats_api_provider.dart';

class CatBloc {
  static final CatBloc _instance = CatBloc._internal();

  factory CatBloc() {
    return _instance;
  }

  CatBloc._internal();

  CatsApiProvider catsProvider = CatsApiProvider();
  StreamController<List<CatsModel>> catController =
      StreamController.broadcast();
  List<CatsModel> cats = [];
  List<CatsModel> searchCats = [];

  Future<void> getCats() async {
    cats = await catsProvider.getCats();
    catController.add(cats);
  }

  filterCats(String name) {
    searchCats.clear();
    if (name.isEmpty) {
      catController.add(cats);
    } else {
      searchCats = cats
          .where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
      catController.add(searchCats);
    }
  }
}
