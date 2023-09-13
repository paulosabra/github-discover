import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'user_search_event.dart';
part 'user_search_state.dart';

class UserSearchBloc extends Bloc<UserSearchEvent, UserSearchState> {
  UserSearchBloc() : super(UserSearchInitial()) {
    on<UserSearchInitialEvent>(_onUserInitialEvent);
    on<UserSearchQueryEvent>(_onUserSearchQueryEvent);
  }
}

void _onUserInitialEvent(UserSearchInitialEvent event, Emitter emit) async {
  emit(UserSearchInitial());
}

void _onUserSearchQueryEvent(UserSearchQueryEvent event, Emitter emit) async {
  try {
    final userName = event.enteredValue.toLowerCase().trim();

    if (userName.isEmpty) {
      emit(const UserSearchEmptyState(message: 'Type a username'));
    } else if (kRepositoryMock.name?.toLowerCase().startsWith(userName) ??
        false) {
      emit(const UserSearchSuccessState(user: kUserMock, quantityFound: 1));
    } else {
      emit(const UserSearchErrorState(message: 'Non-existent user'));
    }
  } catch (e) {
    emit(const UserSearchErrorState(message: 'Error'));
  }
}
