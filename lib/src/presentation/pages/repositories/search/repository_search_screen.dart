import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repository_search/repository_search_bloc.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repository_search_page.dart';

class RepositorySearchScreen extends StatefulWidget {
  const RepositorySearchScreen({super.key});

  @override
  State<RepositorySearchScreen> createState() => _RepositorySearchScreenState();
}

class _RepositorySearchScreenState extends State<RepositorySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositorySearchBloc, RepositorySearchState>(
      builder: (context, state) {
        if (state is RepositorySearchLoadingState) {
          return const CustomLoader();
        }

        if (state is RepositorySearchErrorState) {
          return RepositoriesSearchPage(
            message: state.message,
            repository: null,
            quantityFound: 0,
            onClickRepositorySearchEvent: (repositoryName) {
              context.read<RepositorySearchBloc>().add(
                  RepositorySearchQueryEvent(
                      enteredValue: repositoryName ?? ''));
            },
          );
        }

        if (state is RepositorySearchEmptyState) {
          return RepositoriesSearchPage(
            message: state.message,
            repository: null,
            quantityFound: 0,
            onClickRepositorySearchEvent: (repositoryName) {
              context.read<RepositorySearchBloc>().add(
                  RepositorySearchQueryEvent(
                      enteredValue: repositoryName ?? ''));
            },
          );
        }

        return RepositoriesSearchPage(
          repository: state.repository,
          quantityFound: state.quantityFound ?? 0,
          onClickRepositorySearchEvent: (repositoryName) {
            context.read<RepositorySearchBloc>().add(
                RepositorySearchQueryEvent(enteredValue: repositoryName ?? ''));
          },
        );
      },
    );
  }
}
