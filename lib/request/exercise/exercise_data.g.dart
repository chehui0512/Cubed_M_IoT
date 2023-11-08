// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      user: json['user'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'user': instance.user,
      'score': instance.score,
      'datetime': instance.datetime.toIso8601String(),
    };
