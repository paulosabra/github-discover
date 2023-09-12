import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/repo_search/repo_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_page.dart';

class RepositoriesSearchScreen extends StatefulWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  State<RepositoriesSearchScreen> createState() =>
      _RepositoriesSearchScreenState();
}

class _RepositoriesSearchScreenState extends State<RepositoriesSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoSearchBloc, RepoSearchState>(
        builder: (context, state) {
      if (state is RepoSearchLoadingState) {
        return const CustomLoader();
      }

      if (state is RepoSearchNotFoundState) {
        return CustomEmptyState(
          iconPath: Asset.stopIcon,
          description: state.notFoundMessage ?? '',
        );
      }

      return RepositoriesSearchPage(
        repos: state.repos,
        onRepoSearchSearchEvent: (repoName) {
          context
              .read<RepoSearchBloc>()
              .add(RepoSearchSearchEvent(repoName: repoName));
        },
      );
    });
  }
}
