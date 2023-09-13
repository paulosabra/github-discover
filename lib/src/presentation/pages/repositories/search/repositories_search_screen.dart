import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repositories_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repositories/search/repositories_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_page.dart';
import 'package:go_router/go_router.dart';

class RepositoriesSearchScreen extends StatefulWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  State<RepositoriesSearchScreen> createState() =>
      _RepositoriesSearchScreenState();
}

class _RepositoriesSearchScreenState extends State<RepositoriesSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesSearchBloc, RepositoriesSearchState>(
      builder: (context, state) {
        if (state is RepositoriesSearchLoadingState) {
          return const CustomLoader();
        }

        if (state is RepositoriesSearchEmptyState) {
          debugPrint("Sem resultados");
        }

        if (state is RepositoriesSearchErrorState) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.message ?? '',
          );
        }

        return RepositoriesSearchPage(
          onSearch: (searchString) {
            context
                .read<RepositoriesSearchBloc>()
                .add(RepositorySearchEvent(searchString: searchString));
          },
          repositories: state.repositories,
          onDetailTap: (Repository repository) {
            context
                .read<RepositoriesDetailsBloc>()
                .add(RepositoryLoadingEvent(repository: repository));
            context.goNamed(AppRoute.repositoryDetails.name);
          },
        );
      },
    );
  }
}
