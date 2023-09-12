import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/presentation/blocs/repository_details/bloc/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  const RepositoryDetailsScreen({super.key});

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState
    extends State<RepositoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoryDetailsBloc, RepositoryDetailsState>(
      builder: (context, state) {
        if (state is RepositoryDetailsLoadingState) {
          return const CustomLoader();
        }

        if (state is RepositoryDetailsErrorState) {
          return const RepositoryDetailsPage(
            message: "Error",
            repository: null,
          );
        }

        return const RepositoryDetailsPage(
          repository: kRepositoryMock,
          message: null,
        );
      },
    );
  }
}
