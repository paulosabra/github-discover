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
  Future<RepositoryModel> getRepository(String fullName) async {
    final response = await dio.get(
      '${Env.baseUrl}${Endpoint.repository}$fullName',
    );

    if (response.statusCode == HttpStatus.ok) {
      return RepositoryModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<RepositoryModel>> getRepositories({String? searchArg}) async {
    String enteredValue =
        searchArg != null && searchArg.isNotEmpty ? '?q=$searchArg' : '';

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
}
