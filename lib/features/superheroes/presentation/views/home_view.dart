import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_store/features/superheroes/data/models/character_model.dart';
import 'package:flutter_bloc_store/features/superheroes/logic/bloc/superheroes_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .primaries[Random().nextInt(Colors.primaries.length)]
            .withOpacity(0.5),
        centerTitle: true,
        title: const Text(
          'Characters List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<SuperheroesBloc, SuperheroesState>(
        builder: (context, state) {
          if (state is SuperheroesInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SuperheroesLoaded) {
            return LoadedView(model: state.results);
          } else if (state is SuperheroesError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          } else {
            return const Text('Unknown');
          }
        },
      ),
    );
  }
}

class LoadedView extends StatelessWidget {
  final List<CharacterModel> model;
  const LoadedView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
              .withOpacity(0.5),
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model[index].name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model[index].species!,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
