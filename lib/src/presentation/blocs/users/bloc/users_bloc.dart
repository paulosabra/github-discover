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
   on<UsersLoadingEvent>(_onUsersLoadingEvent);
  }
}


void _onUsersInitialEvent(
    UsersInitialEvent event,
    Emitter emit,
  ) async {
    emit(const UsersSuccessState(
      repository: kRepositoryMock, 
      user: kUserMock
    ));
  }

  
void _onUsersLoadingEvent(
    UsersLoadingEvent event,
    Emitter emit,
  ) async {
    emit(const UsersSuccessState(
      repository: kRepositoryMock, 
      user: kUserMock
    ));
  }

