part of 'superheroes_bloc.dart';

abstract class SuperheroesState extends Equatable {
  const SuperheroesState();

  @override
  List<Object> get props => [];
}

class SuperheroesInitial extends SuperheroesState {}

class SuperheroesLoaded extends SuperheroesState {
  final List<CharacterModel> results;

  const SuperheroesLoaded({required this.results});

  @override
  List<Object> get props => [results];
}

class SuperheroesError extends SuperheroesState {
  final String? error;

  const SuperheroesError({required this.error});
}
