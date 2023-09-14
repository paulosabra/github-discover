import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/presentation/blocs/repository/repositories_details_bloc.dart';
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
    return BlocBuilder<RepositoriesDetailsBloc, RepositoriesDetailsState>(
      builder: (context, state) {
        if (state is RepositoriesDetailsLoading ||
            state is RepositoriesDetailsInitial) {
          return const CustomLoader();
        }

        if (state is RepositoriesDetailsError) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.message,
          );
        }

        return const RepositoryDetailsPage(
          repository: kRepositoryMock,
        );
      },
    );
  }
}
