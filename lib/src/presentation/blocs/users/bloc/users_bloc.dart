import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
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
  emit(const UsersSuccessState(repository: kRepositoryMock, user: kUserMock));
}

void _onUsersSearchEvent(UsersSearchEvent event, Emitter emit) async {
  try {
    final repositoryName = event.search.toLowerCase().trim();

    if (repositoryName.isEmpty) {
      emit(const UserEmptyState(message: 'Nome do repositório'));
      return;
    }

    final matchingRepository = findRepositoryByName(repositoryName);

    if (matchingRepository != null) {
      emit(UsersSuccessState(
          repository: matchingRepository, founded: 1, user: kUserMock));
    } else {
      emit(const UsersErrorState(message: 'Repositório não encontrado'));
    }
  } catch (e) {
    emit(const UsersErrorState(message: 'Error'));
  }
}

Repository? findRepositoryByName(String repositoryName) {
  if (kRepositoryMock.name?.toLowerCase() == repositoryName) {
    return kRepositoryMock;
  }

  return null;
}