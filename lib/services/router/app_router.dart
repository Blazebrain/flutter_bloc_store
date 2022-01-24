import 'package:flutter/material.dart';
import 'package:flutter_bloc_store/features/superheroes/presentation/views/home_view.dart';
import 'package:flutter_bloc_store/services/router/route_names.dart';

class AppRouter {
  static Route _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeView:
        return _materialPageRoute(const HomeView());
      default:
        return _materialPageRoute(
          Scaffold(
            body: Center(
              child: Text(
                'Error 404.'
                'The route ${settings.name} you requested does not exist',
              ),
            ),
          ),
        );
    }
  }
}
