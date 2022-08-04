import 'dart:convert';

import '../models/model_gatitos.dart';
import 'package:http/http.dart' as http;

class GatitosProvider {
  final api = 'https://api.thecatapi.com/v1/breeds';

  Future<List<ModelGatitos>> getCats() async {
    final List<ModelGatitos> cats = [];

    var headers = {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'};
    var request = http.Request('GET', Uri.parse(api));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final decodedData = json.decode(await response.stream.bytesToString());
    if (decodedData == null) return [];

    decodedData.forEach((cat) {
      cats.add(ModelGatitos.fromJson(cat));
    });

    if (response.statusCode == 200) {
      return cats;
    } else {
      return [];
    }
  }
}
