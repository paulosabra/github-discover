import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/repository/bloc/repository_bloc.dart';
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
        
        return const RepositoriesSearchPage(
        );
      },
    );
  }
}