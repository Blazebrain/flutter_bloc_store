part of 'app_bloc.dart';

enum AppStatus { authenticated, unathenticated }

class AppState extends Equatable {
  final AppStatus status;
  final UserModel user;

  const AppState._({
    required this.status,
    this.user = UserModel.empty,
  });

  const AppState.authenticated(UserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unathenticated);

  @override
  List<Object> get props => [];
}
