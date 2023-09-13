import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'users_search_event.dart';
part 'users_search_state.dart';

class UsersSearchBloc extends Bloc<UsersSearchEvent, UsersSearchState> {
  UsersSearchBloc() : super(const UsersSearchInitial(users: [])) {
    on<UserSearchEvent>(_onUserSearchEvent);
  }

  void _onUserSearchEvent(UserSearchEvent event, Emitter emit) async {
    emit(const UsersSearchLoadingState(users: []));

    await Future.delayed(const Duration(seconds: 1));

    debugPrint(event.searchString);

    emit(const UsersSearchSuccessState(users: [kUserMock]));
  }
}
