import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

/// Pilihan kategori, sama dengan EXPERIENCE_CHOICES di model Django.
const Map<String, String> experienceCategories = {
  'internship': 'Internship',
  'research': 'Research',
  'volunteer': 'Volunteer',
  'part-time': 'Part-Time',
  'full-time': 'Full-Time',
  'freelance': 'Freelance',
};

/// Mengubah nilai kategori (mis. 'full-time') menjadi label (mis. 'Full-Time').
String experienceCategoryLabel(String category) =>
    experienceCategories[category] ?? category;

/// Portfolio experience synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    required this.title,
    required this.description,
    this.category = 'full-time',
    this.thumbnail = '',
    this.id,
    this.startedAt,
    this.endedAt,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  final String category;
  @JsonKey(defaultValue: '')
  final String thumbnail;
  @JsonKey(includeToJson: false)
  final DateTime? startedAt;
  final DateTime? endedAt;

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
