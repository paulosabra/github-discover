import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_discover/src/domain/entities/repository.dart';


part 'repo_details_event.dart';
part 'repo_details_state.dart';

class RepoDetailsBloc extends Bloc<RepoDetailsEvent, RepoDetailsState> {
  RepoDetailsBloc() : super(RepoDetailsInitial()) {
    on<RepoDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
