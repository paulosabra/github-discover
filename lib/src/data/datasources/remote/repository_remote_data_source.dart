import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/repository_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class RepositoryRemoteDataSource {
  Future<RepositoryModel> getRepository(String name);
  Future<List<RepositoryModel>> getRepositories({String? searchArg});
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RepositoryModel>> getRepositories({String? searchArg}) async {
    String searchArgQuery =
        (searchArg != null && searchArg.isNotEmpty) ? '?q=$searchArg' : '';

    try {
      Response response = await dio
          .get('${Env.baseUrl}${Endpoint.searchRepositories}$searchArgQuery');

      if (response.statusCode == HttpStatus.ok) {
        List<RepositoryModel> repositories = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (int i = 0; i < items.length; i++) {
          repositories.add(RepositoryModel.fromJson(items[i]));
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
  Future<RepositoryModel> getRepository(String name) async {
    final res = await dio.get(
      '${Env.baseUrl}${Endpoint.repository}$name',
    );

    if (res.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }
}
