import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/Repository_model.dart';
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
        var responseData = response.data;
        var repoItems = responseData["entries"];

        var repoCollection =
            repoItems.map((item) => RepositoryModel.fromJson(item)).toList();

        return repoCollection;
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
