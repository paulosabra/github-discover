import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class RepositoryRemoteDataSource {
  Future<List<RepositoryModel>> getRepositoryList({String? repositoryName});
  Future<RepositoryModel> getRepository(String repositoryName);
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RepositoryModel>> getRepositoryList(
      {String? repositoryName}) async {
    String enteredValue = repositoryName != null && repositoryName.isNotEmpty
        ? '?q=$repositoryName'
        : '';

    try {
      Response response = await dio
          .get('${Env.baseUrl}${Endpoint.searchRepositories}$enteredValue');

      if (response.statusCode == HttpStatus.ok) {
        List<RepositoryModel> repositoriesList = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (var element in items) {
          repositoriesList.add(RepositoryModel.fromJson(element));
        }
        return repositoriesList;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<RepositoryModel> getRepository(String repositoryName) async {
    final response =
        await dio.get('${Env.baseUrl}${Endpoint.repository}$repositoryName');
    if (response.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
