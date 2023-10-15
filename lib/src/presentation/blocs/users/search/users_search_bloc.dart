import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/data/utils/failure.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/domain/usecases/user/get_users_usecase.dart';


part 'users_search_event.dart';
part 'users_search_state.dart';

class UsersSearchBloc
    extends Bloc<UsersSearchEvent, UsersSearchState> {
  final GetUsersUseCase getUsersUseCase;

  UsersSearchBloc({required this.getUsersUseCase})
      : super(UsersSearchInitial()) {
    on<SearchUsersEvent>(_onSearchUsersEvent);
  }

  void _onSearchUsersEvent(
    SearchUsersEvent event,
    Emitter emit,
  ) async {
    emit(UsersSearchLoading());

    Either<Failure, List<User>> users = await getUsersUseCase.execute(search: event.search);

    users.fold(
      (l) => emit(UsersSearchError(message: l.message)), 
      (r) {
        r.isEmpty ? emit(UsersSearchEmpty()) : emit(UsersSearchSuccess(users: r));
      });
  }
}