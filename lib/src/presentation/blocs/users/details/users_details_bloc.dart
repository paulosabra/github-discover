import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'users_details_event.dart';
part 'users_details_state.dart';

class DetailsUserBloc extends Bloc<DetailUsersEvent, DetailsUsersState> {
  DetailsUserBloc() : super(const DetailsUsersLoading()) {
    on<ListDetailUsersEvent>(_onDetailsUsersInitialEvent);
  }

  void _onDetailsUsersInitialEvent(
      ListDetailUsersEvent event, Emitter emit) async {
    emit(const DetailsUsersSuccess(users: [kUserMock]));
  }
}
