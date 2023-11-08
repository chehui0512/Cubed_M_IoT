import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'exercise_data.g.dart';

List<Exercise> parsExerciseList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Exercise>((json) => Exercise.fromJson(json));
}

@JsonSerializable(explicitToJson: true)
class Exercise {
  Exercise({
    required this.user,
    required this.datetime,
    required this.score,
  });

  String user;
  double score;
  DateTime datetime;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
