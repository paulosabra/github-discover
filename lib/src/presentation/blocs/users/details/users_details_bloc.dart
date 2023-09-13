import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'users_details_event.dart';
part 'users_details_state.dart';

class UsersDetailsBloc extends Bloc<UsersDetailsEvent, UsersDetailsState> {
  UsersDetailsBloc() : super(const UsersDetailsLoading()) {
    on<UserLoadingEvent>(_onUserLoading);
  }

  void _onUserLoading(UserLoadingEvent event, Emitter emit) async {
    emit(const UsersDetailsLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(UsersDetailsSuccess(user: event.user));
  }
}
