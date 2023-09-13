import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/repositories/details/repositories_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repositories_details_page.dart';

class RepositoriesDetailsScreen extends StatefulWidget {
  const RepositoriesDetailsScreen({super.key});

  @override
  State<RepositoriesDetailsScreen> createState() =>
      _RepositoriesDetailsScreen();
}

class _RepositoriesDetailsScreen extends State<RepositoriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesDetailsBloc, RepositoriesDetailsState>(
      builder: (context, state) {
        if (state is RepositoriesDetailsInitial) {
          return const CustomLoader();
        }

        if (state is RepositoriesDetailsError) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.error,
          );
        }

        return RepositoryDetailsPage(
          repository: state.repository!,
        );
      },
    );
  }
}
