import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/models/user_model.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers({String? search});
  Future<UserModel> getUser(String fullname);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserModel>> getUsers({String? search}) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?q=$search';
    }

    try {
      Response response =
          await dio.get('${Env.baseUrl}${Endpoint.searchUsers}$queryParam');

      if (response.statusCode == HttpStatus.ok) {
        List<UserModel> users = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (var element in items) {
          users.add(UserModel.fromJson(element));
        }
        return users;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String fullname) async {
    final response = await dio.get(
      '${Env.baseUrl}${Endpoint.user}$fullname',
    );

    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
