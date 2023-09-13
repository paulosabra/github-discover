import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';
part 'users_search_state.dart';
part 'users_search_event.dart';


class SearchUserBloc extends Bloc<FindUsersEvent, SearchUsersState> {
  SearchUserBloc() : super(const SearchUsersInitialState(users: [])) {
    on<FindUsersEvent>(_onSearchUserInitalEvent);
  }

  void _onSearchUserInitalEvent(
    SearchUsersEvent event,
    Emitter emit,
  ) async {
    emit(const SearchUsersSuccessState(users: [kUserMock]));
  }
}
