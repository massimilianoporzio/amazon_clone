import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.address = '',
    this.type = '',
    this.token = '',
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      password,
      address,
      type,
      token,
    ];
  }
}
