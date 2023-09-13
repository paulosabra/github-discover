import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'detail_users_event.dart';
part 'detail_users_state.dart';

class DetailUsersBloc extends Bloc<DetailUsersEvent, DetailUsersState> {
  DetailUsersBloc() : super(const DetailUsersLoading()) {
    on<LoadingUserEvent>(_onUserLoading);
  }

  void _onUserLoading(
    LoadingUserEvent event,
    Emitter emit,
  ) async {
    emit(const DetailUsersLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(DetailUsersSuccess(user: event.user));
  }
}
