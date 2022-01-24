import 'package:flutter_bloc_store/core/api_constants.dart';
import 'package:http/http.dart' as http;

class SuperheroProvider {
  Future<http.Response> getSuperheroes() async {
    final response = await http.get(ApiConstants.getCharacters);
    return response;
  }
}
