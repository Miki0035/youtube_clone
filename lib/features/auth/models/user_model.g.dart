// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userId: json['userId'] as String,
  displayName: json['displayName'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  profilePic: json['profilePic'] as String,
  subscriptions: (json['subscriptions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  videos: (json['videos'] as num).toInt(),
  description: json['description'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'username': instance.username,
      'email': instance.email,
      'profilePic': instance.profilePic,
      'subscriptions': instance.subscriptions,
      'videos': instance.videos,
      'description': instance.description,
      'type': instance.type,
    };
