import 'package:get_it/get_it.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/detail/detail_repositories_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/search_repositories_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/detail/detail_users_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/search_users_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //Bloc
  di.registerLazySingleton<ProfileBloc>(() => ProfileBloc());
  di.registerLazySingleton<SearchRepositoriesBloc>(
      () => SearchRepositoriesBloc());
  di.registerLazySingleton<DetailRepositoriesBloc>(
      () => DetailRepositoriesBloc());
  di.registerLazySingleton<SearchUsersBloc>(() => SearchUsersBloc());
  di.registerLazySingleton<DetailUsersBloc>(() => DetailUsersBloc());
}
