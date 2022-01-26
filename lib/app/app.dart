import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_store/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc_store/features/superheroes/data/providers/superhero_provider.dart';
import 'package:flutter_bloc_store/features/superheroes/data/repositories/superhero_repository.dart';
import 'package:flutter_bloc_store/features/superheroes/logic/bloc/superheroes_bloc.dart';

import 'bloc/app_bloc.dart';
import 'router/app_navigator.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final SuperheroRepository _superheroRepository;
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required SuperheroRepository superheroRepository,
  })  : _superheroRepository = superheroRepository,
        _authenticationRepository = authenticationRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _superheroRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                SuperheroesBloc(repository: context.read<SuperheroRepository>())
                  ..add(SuperheroesInitialLoading()),
          ),
          BlocProvider(
            create: (context) =>
                AppBloc(authenticationRepository: _authenticationRepository),
          )
        ],
        child: MaterialApp(
          title: 'Material App',
          navigatorKey: AppNavigator.key,
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
