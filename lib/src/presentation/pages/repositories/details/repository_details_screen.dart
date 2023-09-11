import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/details_repositories/bloc/repository_details_bloc.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repository_details_page.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  const RepositoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<RepositoryDetailsBloc, RepositoryDetailsState>(
      builder: (context, state) {   

        
        return const RepositoryDetailsPage(
        );
      },
    );
  }
}