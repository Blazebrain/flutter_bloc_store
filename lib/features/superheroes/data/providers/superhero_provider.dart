import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_store/core/utilities/api_constants.dart';
import 'package:flutter_bloc_store/core/failures/failure.dart';
import 'package:flutter_bloc_store/features/superheroes/data/models/character_model.dart';
import 'package:flutter_bloc_store/features/superheroes/data/models/response_model.dart';
import 'package:http/http.dart' as http;

class SuperheroProvider {
  Future<List<CharacterModel>?> getSuperheroes() async {
    try {
      final response = await http.get(ApiConstants.getCharacters);
      if (response.statusCode != 200) {
        throw Failure(
            message: 'Request not successful', statusCode: response.statusCode);
      }
      final decodedResponse =
          CharacterResponseModel.fromJson(json.decode(response.body));

      return decodedResponse.results;
    } on SocketException {
      throw Failure(message: 'No Internet connection 😑');
    } on HttpException {
      throw Failure(message: "Couldn't find the post 😱");
    } on FormatException {
      throw Failure(message: "Bad response format 👎");
    }
  }
}
