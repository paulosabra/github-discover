import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/mock/repository_list_mock.dart';
import 'package:github_discover/src/presentation/blocs/repo_details/repo_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  final int id;

  const RepositoryDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoDetailsBloc, RepoDetailsState>(
        builder: (context, state) {
      if (state is RepoDetailsLoadingState) {
        context.read<RepoDetailsBloc>().add(
              RepoDetailsSearchEvent(id: widget.id),
            );
        return const CustomLoader();
      }

      if (state is RepoDetailsFailState) {
        return CustomEmptyState(
          iconPath: Asset.stopIcon,
          description: state.errorMessage ?? '',
        );
      }

      context.read<RepoDetailsBloc>().add(
            RepoDetailsSearchEvent(id: widget.id),
          );

      return RepositoryDetailsPage(repo: state.repo!);
    });
  }
}
