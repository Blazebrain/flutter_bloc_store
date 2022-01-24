class CharacterModel {
  String? name;
  String? species;
  CharacterModel({
    this.name,
    this.species,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['species'] = species;
    return data;
  }

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
  }
}
