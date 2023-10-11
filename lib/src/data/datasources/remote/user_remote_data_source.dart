import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_discover/src/config/environment/env.dart';
import 'package:github_discover/src/data/utils/endpoints.dart';
import 'package:github_discover/src/data/utils/exception.dart';
import 'package:github_discover/src/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUser({String? search});

}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserModel>> getUser({String? search}) async {
    String queryParam = "";
    if (search != null && search.isNotEmpty) {
      queryParam = '?q=$search';
    }

    try {
      Response response = await dio
          .get('${Env.baseUrl}${Endpoint.searchUsers}$queryParam');

      if (response.statusCode == HttpStatus.ok) {
        List<UserModel> user = List.empty(growable: true);
        Map data = response.data;
        List items = data["items"];
        for (var element in items) {
          user.add(UserModel.fromJson(element));
        }
        return user;
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  
}