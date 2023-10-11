import 'package:dio/dio.dart';
import 'package:github_discover/src/config/hive.dart';
import 'package:github_discover/src/data/datasources/local/profile_local_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/profile_remote_data_source.dart';
import 'package:github_discover/src/data/datasources/remote/user_remote_data_source.dart';
import 'package:github_discover/src/data/repositories/profile_repository_impl.dart';
import 'package:github_discover/src/data/repositories/user_repository_impl.dart';
import 'package:github_discover/src/domain/repositories/profile_repository.dart';
import 'package:github_discover/src/domain/repositories/user_repository.dart';
import 'package:github_discover/src/domain/usecases/profile/get_profile_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/get_skills_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_add_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_delete_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/skill_updated_usecase.dart';
import 'package:github_discover/src/domain/usecases/profile/get_user_usecase.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_bloc.dart';

  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(getIt<Dio>()),
  );
  
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => RepositoryRemoteDataSourceImpl(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        localDataSource: getIt<ProfileLocalDataSource>(),
        remoteDataSource: getIt<ProfileRemoteDataSource>(),
      ));
  getIt.registerLazySingleton<RepositoryRepository>(
      () => RepositoryRepositoryImpl(
            remoteDataSource: getIt<RepositoryRemoteDataSource>(),
          ));

  // UseCases
  getIt.registerLazySingleton(() => GetProfileUseCase(
	@@ -54,6 +66,12 @@ void startModules() {
  getIt.registerLazySingleton(() => SkillUpdateUseCase(
        getIt<ProfileRepository>(),
      ));
  getIt.registerLazySingleton(() => GetRepositoriesUseCase(
        getIt<RepositoryRepository>(),
      ));
  getIt.registerLazySingleton(() => GetRepositoryUseCase(
        getIt<RepositoryRepository>(),
      ));

  // Blocs
  getIt.registerFactory<ProfileBloc>(() => ProfileBloc(
    skillDeleteUseCase: getIt<SkillDeleteUseCase>(),
        skillUpdateUseCase: getIt<SkillUpdateUseCase>(),
      ));
  getIt.registerFactory<RepositoriesSearchBloc>(() => RepositoriesSearchBloc(
        getRepositoriesUseCase: getIt<GetRepositoriesUseCase>(),
      ));
  getIt.registerFactory<RepositoryDetailsBloc>(() => RepositoryDetailsBloc(
        getRepositoryUseCase: getIt<GetRepositoryUseCase>(),
      ));
  getIt.registerFactory<UsersSearchBloc>(() => UsersSearchBloc());
  getIt.registerFactory<UserDetailsBloc>(() => UserDetailsBloc());
}