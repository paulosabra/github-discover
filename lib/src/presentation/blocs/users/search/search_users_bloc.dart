import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  SearchUsersBloc() : super(const SearchUsersInitial(users: [])) {
    on<SearchUserEvent>(_onSearchUserEvent);
  }

  void _onSearchUserEvent(SearchUserEvent event, Emitter emit) async {
    emit(const SearchUsersLoadingState(users: []));

    await Future.delayed(const Duration(seconds: 1));

    print(event.searchString);

    if (event.searchString.isEmpty) {
      emit(const SearchUsersErrorState(
        users: [],
        errorMessage: "O campo está vazio!",
      ));
    } else {
      emit(const SearchUsersSuccessState(users: [kUserMock]));
    }
  }
}
