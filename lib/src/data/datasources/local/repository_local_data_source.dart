import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _repositoryBox = 'RepositoryBox';

abstract class RepositoryLocalDataSource {
  Future<List<RepositoryModel>> getRepositoriesList();
}

class RepositoryLocalDataSourceImpl implements RepositoryLocalDataSource {
  final HiveInterface hive;

  RepositoryLocalDataSourceImpl(this.hive);

  @override
  Future<List<RepositoryModel>> getRepositoriesList() async {
    final box = await hive.openBox(_repositoryBox);
    return box.values
        .map((repository) => RepositoryModel(
              id: repository.id,
              name: repository.name,
              fullName: repository.fullName,
              private: repository.private,
              owner: repository.owner,
              htmlUrl: repository.htmlUrl,
              license: repository.license,
              language: repository.language,
              description: repository.description,
              visibility: repository.visibility,
              fork: repository.fork,
              stargazersCount: repository.stargazersCount,
              forksCount: repository.forksCount,
              subscribersCount: repository.subscribersCount,
              createdAt: repository.createdAt,
              updatedAt: repository.updatedAt,
              pushedAt: repository.pushedAt,
            ))
        .toList();
  }
}
