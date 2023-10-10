import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/User.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/domain/usecases/user/get_user_usecase.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc
    extends Bloc<UserDetailsEvent, UserDetailsState> {
  final GetUserUseCase getUserUseCase;

  UserDetailsBloc({required this.getUserUseCase})
      : super(UserDetailsInitial()) {
    on<UserDetailLoadedEvent>(_onUserDetailLoadedEvent);
  }

  void _onUserDetailLoadedEvent(
    UserDetailLoadedEvent event,
    Emitter emit,
  ) async {
    emit(UserDetailsLoading());

    final result = await getUserUseCase.execute(event.fullName!);
    result.fold(
      (failure) {
        emit(UserDetailsError(
          message: failure.message,
        ));
      },
      (data) {
        emit(UserDetailsSuccess(user: data, repositories: repositories));
      },
    );
  }
}