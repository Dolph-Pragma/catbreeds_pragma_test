import 'dart:convert';

import '../models/model_gatitos.dart';
import 'package:http/http.dart' as http;

class CatsApiProvider {
  final api = 'https://api.thecatapi.com/v1/breeds';

  Future<List<CatsModel>> getCats() async {
    final List<CatsModel> cats = [];

    var headers = {
      'x-api-key':
          'live_IlRQjj0PEkaPQexhFMlOsmv8vU3llljNUpR8sy3eZ07HRyeJMRcklU6pqABpMkdG'
    };
    var request = http.Request('GET', Uri.parse(api));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final decodedData = json.decode(await response.stream.bytesToString());
    if (decodedData == null) return [];

    decodedData.forEach((cat) {
      cats.add(CatsModel.fromJson(cat));
    });

    if (response.statusCode == 200) {
      return cats;
    } else {
      return [];
    }
  }
}
