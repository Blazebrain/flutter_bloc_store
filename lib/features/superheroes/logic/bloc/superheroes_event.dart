part of 'superheroes_bloc.dart';

abstract class SuperheroesEvent extends Equatable {
  const SuperheroesEvent();

  @override
  List<Object> get props => [];
}

class SuperheroesInitialLoading extends SuperheroesEvent {}
