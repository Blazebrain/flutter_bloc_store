import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_store/features/superheroes/data/models/character_model.dart';
import 'package:flutter_bloc_store/features/superheroes/data/repositories/superhero_repository.dart';

part 'superheroes_event.dart';
part 'superheroes_state.dart';

class SuperheroesBloc extends Bloc<SuperheroesEvent, SuperheroesState> {
  final SuperheroRepository _repository;
  SuperheroesBloc({required SuperheroRepository repository})
      : _repository = repository,
        super(SuperheroesInitial()) {
    on<SuperheroesInitialLoading>(_loadHeroes);
  }

  FutureOr<void> _loadHeroes(event, emit) async {
    try {
      final results = await _repository.getSuperheroes();
      emit(SuperheroesLoaded(results: results!));
    } on Exception catch (e) {
      addError(e);
      emit(SuperheroesError(error: e.toString()));
    }
  }
}
