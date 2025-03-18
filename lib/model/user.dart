import 'package:unify/model/role.dart';

class User {

  final String id;
  String firstName;
  String lastName;
  String username;
  String phone;
  final String email;
  DateTime registerAt;
  bool gender;
  DateTime birthDay;
  String location;
  String education;
  String workAt;
  String biography;
  final List<Role> roles;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.phone,
      required this.email,
      required this.birthDay,
      required this.registerAt,
      required this.gender,
      required this.biography,
      required this.education,
      required this.location,
      required this.roles,
      required this.workAt});
}
