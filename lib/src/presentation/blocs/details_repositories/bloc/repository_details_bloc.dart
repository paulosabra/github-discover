import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_details_event.dart';
part 'repository_details_state.dart';

class RepositoryDetailsBloc extends Bloc<RepositoryDetailsEvent, RepositoryDetailsState> {
  RepositoryDetailsBloc() : super(RepositoryDetailsInitialState()) {
    on<RepositotryDetailsInitalEvent>(_onRepositoryDetailsInitalEvent);
  }
}


 void _onRepositoryDetailsInitalEvent(
    RepositotryDetailsInitalEvent event,
    Emitter emit,
  ) async {
    emit(const RepositoryDetailsSuccessState(
      repository: kRepositoryMock,
    ));
  }
