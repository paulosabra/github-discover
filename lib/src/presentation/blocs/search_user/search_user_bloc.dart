import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/profile.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  SearchUserBloc() : super(SearchUserInitial()) {
    on<SearchUserEvent>((event, emit) {

    });
  }
}
