import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repositories_details_event.dart';
part 'repositories_details_state.dart';

class RepositoriesDetailsBloc
    extends Bloc<RepositoriesDetailsEvent, RepositoriesDetailsState> {
  RepositoriesDetailsBloc() : super(const RepositoriesDetailsLoading()) {
    on<RepositoryLoadingEvent>(_onRepositoryLoading);
  }

  void _onRepositoryLoading(RepositoryLoadingEvent event, Emitter emit) async {
    emit(const RepositoriesDetailsLoading());

    await Future.delayed(const Duration(seconds: 1));

    emit(RepositoriesDetailsSuccess(repository: event.repository));
  }
}
