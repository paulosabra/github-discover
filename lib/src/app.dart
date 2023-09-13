import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/detail/detail_repositories_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/search_repositories_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/detail/detail_users_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/search_users_bloc.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';

class GitHubDiscoverApp extends StatelessWidget {
  const GitHubDiscoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileInitalEvent()),
        ),
        BlocProvider(
          create: (context) => SearchRepositoriesBloc(),
        ),
        BlocProvider(
          create: (context) => DetailRepositoriesBloc(),
        ),
        BlocProvider(
          create: (context) => SearchUsersBloc(),
        ),
        BlocProvider(
          create: (context) => DetailUsersBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        onGenerateTitle: (context) => context.locales.appTitle,
        routerConfig: router,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
