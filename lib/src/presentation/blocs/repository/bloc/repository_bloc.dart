import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  RepositoryBloc() : super(RepositoryInitial()) {
    on<RepositoryInitalEvent>(_onRepositoryInitialEvent);
   on<RepositoryLoadingEvent>(_onRepositoryLoadingEvent);
  }
}


void _onRepositoryInitialEvent(
    RepositoryInitalEvent event,
    Emitter emit,
  ) async {
    emit(const RepositorySuccessState(
      repository: kRepositoryMock
    ));
  }

  
void _onRepositoryLoadingEvent(
    RepositoryLoadingEvent event,
    Emitter emit,
  ) async {
    emit(const RepositorySuccessState(
      repository: kRepositoryMock
    ));
  }