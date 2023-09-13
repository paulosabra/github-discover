import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_user_event.dart';
part 'details_user_state.dart';

class DetailsUserBloc extends Bloc<DetailsUserEvent, DetailsUserState> {
  DetailsUserBloc() : super(DetailsUserInitial()) {
    on<DetailsUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
