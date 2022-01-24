import 'character_model.dart';
import 'info_model.dart';

class CharacterResponseModel {
  Info? info;
  List<CharacterModel>? results;

  CharacterResponseModel({this.info, this.results});

  CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(CharacterModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
