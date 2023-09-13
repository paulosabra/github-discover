import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repository/bloc/repository_bloc.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_page.dart';

class RepositorySearchScreen extends StatefulWidget {
  const RepositorySearchScreen({super.key});

  @override
  State<RepositorySearchScreen> createState() => _RepositorySearchScreenState();
}

class _RepositorySearchScreenState extends State<RepositorySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryBloc, RepositoryState>(
      builder: (context, state) {
        if (state is RepositoryLoadingState) {
          return const CustomLoader();
        }

         if (state is RepositoryEmptyState) {
          return RepositoriesSearchPage(
            message: state.message,
            repository: null,
            findItens: 0,
            onFindEvent: (name) {
              context
                  .read<RepositoryBloc>()
                  .add(RepositoryFindEvent(search: name ?? ''));
            },
          );
        }

        if (state is RepositoryErrorState) {
          return RepositoriesSearchPage(
            message: state.message,
            repository: null,
            findItens: 0,
            onFindEvent: (name) {
              context
                  .read<RepositoryBloc>()
                  .add(RepositoryFindEvent(search: name ?? ''));
            },
          );
        }
        return RepositoriesSearchPage(
          repository: state.repository,
          findItens: state.founded ?? 0,
          onFindEvent: (name) {
            context
                .read<RepositoryBloc>()
                .add(RepositoryFindEvent(search: name ?? ''));
          },
        );
      },
    );
  }
}
