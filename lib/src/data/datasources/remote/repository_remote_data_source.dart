import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class RepositoryRemoteDataSource {
  Future<List<RepositoryModel>> getRepositories({String? searchRepositories});
  Future<RepositoryModel> getRepository(String nameRepository);
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RepositoryModel>> getRepositories(
      {String? searchRepositories}) async {
    String queryParam = "";
    if (searchRepositories != null && searchRepositories.isNotEmpty) {
      queryParam = '?q=$searchRepositories';
    }

    try {
      Response response = await dio
          .get('${Env.baseUrl}${Endpoint.searchRepositories}$queryParam');

      if (response.statusCode == HttpStatus.ok) {
        List<RepositoryModel> repositories = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (var element in items) {
          repositories.add(RepositoryModel.fromJson(element));
        }
        return repositories;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<RepositoryModel> getRepository(String fullname) async {
    final response = await dio.get(
      '${Env.baseUrl}${Endpoint.repository}$fullname',
    );

    if (response.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
