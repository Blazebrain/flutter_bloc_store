import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_store/bloc_observer.dart';
import 'package:flutter_bloc_store/features/superheroes/data/providers/superhero_provider.dart';
import 'package:flutter_bloc_store/services/router/app_navigator.dart';

import 'features/superheroes/data/repositories/superhero_repository.dart';
import 'features/superheroes/logic/bloc/superheroes_bloc.dart';
import 'services/router/app_router.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(
        provider: SuperheroProvider(),
      ),
    ),
    blocObserver: SuperheroBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final SuperheroProvider provider;
  const MyApp({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SuperheroRepository(superheroProvider: provider),
      child: BlocProvider(
        create: (context) =>
            SuperheroesBloc(repository: context.read<SuperheroRepository>())
              ..add(SuperheroesInitialLoading()),
        child: MaterialApp(
          title: 'Material App',
          navigatorKey: AppNavigator.key,
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
