import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/profile_mock.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'repository_details_event.dart';
part 'repository_details_state.dart';

class RepositoryDetailsBloc
    extends Bloc<RepositoryDetailsEvent, RepositoryDetailsState> {
  RepositoryDetailsBloc() : super(RepositoryDetailsInitial()) {
    on<RepositoryDetailsInitialEvent>(_onRepositoryDetailsInitialEvent);
    on<RepositoryDetailsLoadingEvent>(_onRepositoryDetailsLoadingEvent);
  }
}

void _onRepositoryDetailsInitialEvent(
    RepositoryDetailsInitialEvent event, Emitter emit) async {
  emit(RepositoryDetailsInitial());
}

void _onRepositoryDetailsLoadingEvent(
    RepositoryDetailsLoadingEvent event, Emitter emit) async {
  if (kProfileMock.id == event.repositoryKey) {
    emit(const RepositoryDetailsSuccessState(repository: kRepositoryMock));
  } else {
    emit(const RepositoryDetailsErrorState(message: "Non-existent repository"));
  }
  emit(RepositoryDetailsLoadingEvent(repositoryKey: event.repositoryKey));
}
