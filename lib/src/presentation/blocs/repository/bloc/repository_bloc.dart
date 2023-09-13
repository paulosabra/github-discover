import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  RepositoryBloc() : super(RepositoryInitial()) {
    on<RepositoryInitalEvent>(_onRepositoryInitialEvent);
    on<RepositoryFindEvent>(_onRepositoryFindEvent);
  }
}

void _onRepositoryInitialEvent(
  RepositoryInitalEvent event,
  Emitter emit,
) async {
  emit(RepositoryInitalEvent());
}


void _onRepositoryFindEvent(RepositoryFindEvent event, Emitter emit) async {
  try {
    final repositoryName = event.search.toLowerCase().trim();

    if (repositoryName.isEmpty) {
      emit(const RepositoryEmptyState(message: 'Nome do repositório'));
      return;
    }

    final matchingRepository = findRepositoryByName(repositoryName);

    if (matchingRepository != null) {
      emit(RepositorySuccessState(
          repository: matchingRepository, founded: 1));
    } else {
      emit(const RepositoryErrorState(message: 'Repositório não encontrado'));
    }
  } catch (e) {
    emit(const RepositoryErrorState(message: 'Error'));
  }
}

Repository? findRepositoryByName(String repositoryName) {
  if (kRepositoryMock.name?.toLowerCase() == repositoryName) {
    return kRepositoryMock;
  }

  return null;
}
