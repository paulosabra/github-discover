import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/domain/entities/user.dart';

part 'details_user_event.dart';
part 'details_user_state.dart';

class DetailsUserBloc extends Bloc<DetailsUserEvent, DetailsUserState> {
  DetailsUserBloc() : super(DetailsUserInitial()) {
    on<DetailsUserInitialEvent>(_onUserDetailsInitialEvent);
    on<ShowDetailsUserEvent>(_onUserDetailsSearchEvent);
  }
}


void _onUserDetailsInitialEvent(
  DetailsUserInitialEvent event, Emitter emit) async {
  emit(DetailsUserInitial());
}

void _onUserDetailsSearchEvent(
  ShowDetailsUserEvent event, Emitter emit) async {
  bool found = kUserMock.id == event.id;

  if (found) {
    emit(const DetailsUserSuccessState(user: kUserMock));
  } else {
    emit(const DetailsUserErrorState(message: "Usuário não encontrado."));
  }
  emit(ShowDetailsUserEvent(id: event.id));
}