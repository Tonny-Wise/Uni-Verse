import 'package:freezed_annotation/freezed_annotation.dart';

part 'university.freezed.dart';
part 'university.g.dart';

@freezed
class University with _$University {
  const factory University({
    required String id,
    required String name,
    @JsonKey(name: 'short_name') required String shortName,
    required String location,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _University;

  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);
}
