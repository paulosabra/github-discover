import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'users_details_event.dart';
part 'users_details_state.dart';

class UsersDetailsBloc extends Bloc<UsersDetailsEvent, UsersDetailsState> {
  UsersDetailsBloc() : super(UsersDetailsInitial()) {
    on<UsersDetailsInitalEvent>(_onUsersDetailsInitalEvent);
    on<UsersDetailsLoadingEvent>(_onUsersLoadingDetailsInitalEvent);
  }
}

void _onUsersDetailsInitalEvent(
  UsersDetailsInitalEvent event,
  Emitter emit,
) async {
  emit(const UsersDetailsSuccessState(
    repository: kRepositoryMock,
    users: [kUserMock],
  ));
}

void _onUsersLoadingDetailsInitalEvent(
  UsersDetailsLoadingEvent event,
  Emitter emit,
) async {
  emit(const UsersDetailsSuccessState(
    repository: kRepositoryMock,
    users: [kUserMock],
  ));
}
