import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  SkillModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}
