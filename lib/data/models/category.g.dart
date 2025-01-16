// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      isFeatured: json['isFeatured'] as bool? ?? false,
      serviceCount: (json['serviceCount'] as num?)?.toInt() ?? 0,
      providerCount: (json['providerCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'imageUrl': instance.imageUrl,
      'displayOrder': instance.displayOrder,
      'isActive': instance.isActive,
      'isFeatured': instance.isFeatured,
      'serviceCount': instance.serviceCount,
      'providerCount': instance.providerCount,
    };
