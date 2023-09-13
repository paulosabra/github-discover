import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/profile_mock.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'details_repository_event.dart';
part 'details_repository_state.dart';

class DetailsRepositoryBloc extends Bloc<DetailsRepositoryEvent, DetailsRepositoryState> {
  DetailsRepositoryBloc() : super(DetailsRepositoryInitial()) {
    on<DetailsRepositoryInitialEvent>(_onDetailsRepositoryInitialEvent);
    on<ShowDetailsRepositoryEvent>(_onDetailRepositorySearchEvent);
  }
}

void _onDetailsRepositoryInitialEvent(
    DetailsRepositoryInitialEvent event, Emitter emit) async {
  emit(DetailsRepositoryInitial());
}

void _onDetailRepositorySearchEvent(
  ShowDetailsRepositoryEvent event, Emitter emit) async {
  bool found = kProfileMock.id == event.id;

  if (found) {
    emit(const DetailsRepositorySuccessState(repository: kRepositoryMock));
  } else {
    emit(const DetailsRepositoryErrorState(
      message: "Repositório não encontrado ou inexistente."));
  }

  emit(DetailsRepositorySearchState(id: event.id));
}