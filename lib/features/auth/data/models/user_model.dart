import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? email;
  final String id;
  final String? name;
  final String? photo;

  const UserModel({
    this.email,
    required this.id,
    this.name,
    this.photo,
  });

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
