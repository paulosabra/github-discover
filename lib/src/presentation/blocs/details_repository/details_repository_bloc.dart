import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';

part 'details_repository_event.dart';
part 'details_repository_state.dart';

class DetailsRepositoryBloc extends Bloc<DetailsRepositoryEvent, DetailsRepositoryState> {
  DetailsRepositoryBloc() : super(DetailsRepositoryInitial()) {
    on<DetailsRepositoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
