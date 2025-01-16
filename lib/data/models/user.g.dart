// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      profileImage: json['profileImage'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      favoriteShops: (json['favoriteShops'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'gender': instance.gender,
      'profileImage': instance.profileImage,
      'birthDate': instance.birthDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'address': instance.address,
      'favoriteShops': instance.favoriteShops,
      'isEmailVerified': instance.isEmailVerified,
      'isPhoneVerified': instance.isPhoneVerified,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'deviceToken': instance.deviceToken,
    };
