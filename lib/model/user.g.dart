// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      birthDay: DateTime.parse(json['birthDay'] as String),
      registerAt: DateTime.parse(json['registerAt'] as String),
      gender: json['gender'] as bool,
      biography: json['biography'] as String,
      education: json['education'] as String,
      location: json['location'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      workAt: json['workAt'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'phone': instance.phone,
      'email': instance.email,
      'registerAt': instance.registerAt.toIso8601String(),
      'gender': instance.gender,
      'birthDay': instance.birthDay.toIso8601String(),
      'location': instance.location,
      'education': instance.education,
      'workAt': instance.workAt,
      'biography': instance.biography,
      'roles': instance.roles,
    };
