import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<UserDetailsInitialEvent>(_onUserDetailsInitialEvent);
    on<UserDetailsLoadingEvent>(_onUserDetailsLoadingEvent);
  }
}

void _onUserDetailsInitialEvent(
    UserDetailsInitialEvent event, Emitter emit) async {
  emit(UserDetailsInitial());
}

void _onUserDetailsLoadingEvent(
    UserDetailsLoadingEvent event, Emitter emit) async {
  if (kUserMock.id == event.userKey) {
    emit(const UserDetailsSuccessState(user: kUserMock));
  } else {
    emit(const UserDetailsErrorState(message: "Non-existent user"));
  }
  emit(UserDetailsLoadingEvent(userKey: event.userKey));
}
