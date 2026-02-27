// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UniversityImpl _$$UniversityImplFromJson(Map<String, dynamic> json) =>
    _$UniversityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortName: json['short_name'] as String,
      location: json['location'] as String,
      logoUrl: json['logo_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UniversityImplToJson(_$UniversityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.shortName,
      'location': instance.location,
      'logo_url': instance.logoUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
