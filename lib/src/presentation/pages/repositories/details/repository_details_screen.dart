import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/repositories/detail/detail_repositories_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  const RepositoryDetailsScreen({super.key});

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailRepositoriesBloc, DetailRepositoriesState>(
      builder: (context, state) {
        if (state is DetailRepositoriesInitial) {
          return const CustomLoader();
        }
        if (state is DetailRepositoriesLoading) {
          return const CustomLoader();
        }

        if (state is DetailRepositoriesError) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.messageError,
          );
        }

        return RepositoryDetailsPage(
          repository: state.repository!,
        );
      },
    );
  }
}
