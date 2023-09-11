import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'detail_repositories_event.dart';
part 'detail_repositories_state.dart';

class DetailRepositoriesBloc
    extends Bloc<DetailRepositoriesEvent, DetailRepositoriesState> {
  DetailRepositoriesBloc() : super(const DetailRepositoriesLoading()) {
    on<RepositoryLoadingEvent>(_onRepositoryLoading);
  }

  void _onRepositoryLoading(
    RepositoryLoadingEvent event,
    Emitter emit,
  ) async {
    emit(const DetailRepositoriesLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(DetailRepositoriesSucess(repository: event.repository));
  }
}
