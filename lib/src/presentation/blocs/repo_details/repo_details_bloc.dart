import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/constants/mock/repository_list_mock.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repo_details_event.dart';
part 'repo_details_state.dart';

class RepoDetailsBloc extends Bloc<RepoDetailsEvent, RepoDetailsState> {
  RepoDetailsBloc() : super(RepoDetailsInitial()) {
    on<RepoDetailsSearchEvent>(_onRepoDetailsSearchEvent);
    on<RepoDetailsInitialEvent>(_onRepoDetailsInitialEvent);
  }

  void _onRepoDetailsInitialEvent(
    RepoDetailsInitialEvent event,
    Emitter emit,
  ) async {
    emit(
      RepoDetailsLoadingState(),
    );
  }

  void _onRepoDetailsSearchEvent(
    RepoDetailsSearchEvent event,
    Emitter emit,
  ) async {
    final repo = kRepositoryListMock[event.id];

    emit(
      RepoDetailsSuccessState(repository: repo),
    );
  }
}
