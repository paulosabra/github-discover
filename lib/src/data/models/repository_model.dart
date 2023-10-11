import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/license.dart';
import 'package:github_discover/src/domain/entities/owner.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RepositoryModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'private')
  final bool? private;
  @JsonKey(name: 'owner')
  final Owner? owner;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'license')
  final License? license;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'visibility')
  final String? visibility;
  @JsonKey(name: 'fork')
  final bool? fork;
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @JsonKey(name: 'watchers_count')
  final int? subscribersCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'pushed_at')
  final String? pushedAt;

  const RepositoryModel({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.license,
    required this.language,
    required this.description,
    required this.visibility,
    required this.fork,
    required this.forksCount,
    required this.stargazersCount,
    required this.subscribersCount,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);

  Repository toEntity() => Repository(
      id: id,
      name: name,
      fullName: fullName,
      private: private,
      owner: owner,
      htmlUrl: htmlUrl,
      license: license,
      language: language,
      description: description,
      visibility: visibility,
      fork: fork,
      forksCount: forksCount,
      stargazersCount: stargazersCount,
      subscribersCount: subscribersCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      pushedAt: pushedAt);

  @override
  List<Object?> get props => [
        id,
        name,
        fullName,
        private,
        owner,
        htmlUrl,
        license,
        language,
        description,
        visibility,
        fork,
        stargazersCount,
        forksCount,
        subscribersCount,
        createdAt,
        updatedAt,
        pushedAt,
      ];
}

typedef Repositories = List<RepositoryModel>;
