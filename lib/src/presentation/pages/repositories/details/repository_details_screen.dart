import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';

import '../../../../constants/mock/repository_mock.dart';
import '../../../blocs/details_repository/details_repository_bloc.dart';

class RepositoriesDetailsScreen extends StatefulWidget {
  const RepositoriesDetailsScreen({super.key});

  @override
  State<RepositoriesDetailsScreen> createState() => _RepositoriesDetailsScreenState();
}

class _RepositoriesDetailsScreenState extends State<RepositoriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsRepositoryBloc, DetailsRepositoryState>(
      builder: (context, state) {
        if (state is DetailsRepositoryErrorState) {
          return RepositoryDetailsPage(
            message: state.message,
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