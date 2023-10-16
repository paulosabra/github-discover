import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'login')
  final String? login;
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @JsonKey(name: 'htmlUrl')
  final String? htmlUrl;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'company')
  final String? company;
  @JsonKey(name: 'blog')
  final String? blog;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'bio')
  final String? bio;
  @JsonKey(name: 'twitterUsername')
  final String? twitterUsername;
  @JsonKey(name: 'publicRepos')
  final int? publicRepos;
  @JsonKey(name: 'publicGists')
  final int? publicGists;
  @JsonKey(name: 'followers')
  final int? followers;
  @JsonKey(name: 'following')
  final int? following;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  const UserModel({
    this.id,
    this.login,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
        id: id,
        login: login,
        avatarUrl: avatarUrl,
        htmlUrl: htmlUrl,
        name: name,
        company: company,
        blog: blog,
        location: location,
        bio: bio,
        twitterUsername: twitterUsername,
        publicRepos: publicRepos,
        publicGists: publicGists,
        followers: followers,
        following: following,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
        htmlUrl,
        name,
        company,
        blog,
        location,
        bio,
        twitterUsername,
        publicRepos,
        publicGists,
        followers,
        following,
        createdAt,
        updatedAt,
      ];
}
