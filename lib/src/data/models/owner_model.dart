import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/owner.dart';

class OwnerModel extends Equatable {
  final int? id;
  final String? login;
  final String? avatarUrl;

  const OwnerModel({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  Owner toEntity() => Owner(id: id, login: login, avatarUrl: avatarUrl)

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
      ];
}
