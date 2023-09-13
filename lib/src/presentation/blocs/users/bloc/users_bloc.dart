import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersInitialEvent>(_onUsersInitialEvent);
    on<UsersSearchEvent>(_onUsersSearchEvent);
  }
}

void _onUsersInitialEvent(
  UsersInitialEvent event,
  Emitter emit,
) async {
  emit(const UsersSuccessState(user: kUserMock));
}

void _onUsersSearchEvent(UsersSearchEvent event, Emitter emit) async {
  try {
    final usersName = event.search.toLowerCase().trim();

    if (usersName.isEmpty) {
      emit(const UserEmptyState(message: 'Nome do usuário'));
      return;
    }

    final matchingUsers = findUsersByName(usersName);

    if (matchingUsers != null) {
      emit(UsersSuccessState(user: matchingUsers, founded: 1));
    } else {
      emit(const UsersErrorState(message: 'Usuário não encontrado'));
    }
  } catch (e) {
    emit(const UsersErrorState(message: 'Error'));
  }
}

User? findUsersByName(String usersName) {
  if (kUserMock.name?.toLowerCase() == usersName) {
    return kUserMock;
  }

  return null;
}