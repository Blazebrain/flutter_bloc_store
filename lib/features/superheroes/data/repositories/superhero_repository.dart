import '../../../../core/failures/failure.dart';
import '../models/character_model.dart';
import '../providers/superhero_provider.dart';

class SuperheroRepository {
  SuperheroProvider? superheroProvider;
  SuperheroRepository({required this.superheroProvider});

  Failure? _failure;
  Failure? get failure => _failure;

  Future<List<CharacterModel>?> getSuperheroes() async {
    try {
      final results = await superheroProvider?.getSuperheroes();
      return results;
    } on Failure catch (e) {
      throw Failure(message: e.message);
    }
  }
}
