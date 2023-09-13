import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repositories_details_event.dart';
part 'repositories_details_state.dart';

class RepositoriesDetailsBloc
    extends Bloc<RepositoriesDetailsEvent, RepositoriesDetailsState> {
  RepositoriesDetailsBloc() : super(const RepositoriesDetailsInitial()) {
    on<RepositoriesDetailsEvent>(_onDetailsRepositoryInitialEvent);
  }

  void _onDetailsRepositoryInitialEvent(
    RepositoriesDetailsEvent event,
    Emitter emit,
  ) async {
    emit(const RepositoriesDetailsSuccess(repository: kRepositoryMock));
  }
}
