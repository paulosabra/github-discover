import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/repositorySearch/repo_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_page.dart';

class RepoSearchScreen extends StatefulWidget {
  const RepoSearchScreen({super.key});

  @override
  State<RepoSearchScreen> createState() => _RepoSearchScreenState();
}

class _RepoSearchScreenState extends State<RepoSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoSearchBloc, RepoSearchState>(
      builder: (context, state) {

        if(state is RepoSearchLoadingState) {
          return const CustomLoader();
        }

        if (state is RepoSearchErrorState) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.message ?? '',
          );
        }

        return RepositoriesSearchPage(

);

      },
    );
  }
}