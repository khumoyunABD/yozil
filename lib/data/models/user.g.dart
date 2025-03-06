// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      userType: json['userType'] as String? ?? 'customer',
      isPremium: json['isPremium'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String?,
      businessName: json['businessName'] as String?,
      businessDescription: json['businessDescription'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'userType': instance.userType,
      'isPremium': instance.isPremium,
      'phoneNumber': instance.phoneNumber,
      'businessName': instance.businessName,
      'businessDescription': instance.businessDescription,
    };
