import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/cat_model.dart';
import '../models/favorite_cat_model.dart';

class CatsApiProvider {
  static final CatsApiProvider _instance = CatsApiProvider._internal();
  CatsApiProvider._internal();
  factory CatsApiProvider() {
    return _instance;
  }

  final apiBreeds = 'https://api.thecatapi.com/v1/breeds';
  final apiFavorites = 'https://api.thecatapi.com/v1/favourites';

  final Map<String, String> headers = {
    'content-type': "application/json",
    'x-api-key':
        'live_IlRQjj0PEkaPQexhFMlOsmv8vU3llljNUpR8sy3eZ07HRyeJMRcklU6pqABpMkdG'
  };

  Future<List<CatModel>> getCats() async {
    final List<CatModel> cats = [];

    var request = http.Request('GET', Uri.parse(apiBreeds));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final decodedData = json.decode(await response.stream.bytesToString());
    if (decodedData == null) return [];

    decodedData.forEach((cat) {
      cats.add(CatModel.fromJson(cat));
    });

    if (response.statusCode == 200) {
      return cats;
    } else {
      return [];
    }
  }

  Future<List<FavoriteCatModel>> getFavorites() async {
    http.Response getResponse =
        await http.get(Uri.parse(apiFavorites), headers: headers);

    if (getResponse.statusCode == 200) {
      List decodedFavorites = jsonDecode(getResponse.body);
      final List<FavoriteCatModel> favoriteCats =
          decodedFavorites.map((e) => FavoriteCatModel.fromJson(e)).toList();
      return favoriteCats;
    } else {
      throw Exception(
          'Failure in getting favorites from CatAPI: ${getResponse.reasonPhrase}');
    }
  }

  Future<void> postFavoriteCat(String imageId) async {
    final postResponse = await http.post(
      Uri.parse(apiFavorites),
      body: jsonEncode({"image_id": imageId}),
      headers: headers,
    );

    if (postResponse.statusCode == 200) {
      debugPrint('Success in post request: ${postResponse.body}');
      return;
    } else {
      throw Exception(
          'Failure in posting favorite Request: ${postResponse.reasonPhrase}');
    }
  }

  Future<void> deleteCatFromFavorites(int catFavoriteId) async {
    final deleteResponse = await http
        .delete(Uri.parse('$apiFavorites/$catFavoriteId'), headers: headers);

    if (deleteResponse.statusCode == 200) {
      debugPrint(
          'Cat $catFavoriteId deleted successfully from favorites: ${deleteResponse.body}');
    } else {
      throw Exception(
          'Failure in deleting selected favorite: ${deleteResponse.reasonPhrase}');
    }
  }
}
