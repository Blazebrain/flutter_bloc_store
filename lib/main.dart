import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'features/auth/data/providers/firebase_auth.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/superheroes/data/providers/superhero_provider.dart';
import 'features/superheroes/data/repositories/superhero_repository.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(
        App(
            authenticationRepository:
                AuthenticationRepository(provider: FirebaseAuthProvider()),
            superheroRepository:
                SuperheroRepository(superheroProvider: SuperheroProvider())),
      );
    },
    blocObserver: SuperheroBlocObserver(),
  );
}
