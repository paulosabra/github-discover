import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/domain/usecases/profile/get_user_usecase.dart';


part 'users_search_event.dart';
part 'users_search_state.dart';

class UsersSearchBloc
    extends Bloc<UsersSearchEvent, UsersSearchState> {
  final GetUserUseCase getUsersUseCase;

  UsersSearchBloc({required this.getUsersUseCase})
      : super(UsersSearchInitial()) {
    on<SearchUsersEvent>(_onSearchUsersEvent);
  }

  void _onSearchUsersEvent(
    SearchUsersEvent event,
    Emitter emit,
  ) async {
    emit(UsersSearchLoading());

  }
}