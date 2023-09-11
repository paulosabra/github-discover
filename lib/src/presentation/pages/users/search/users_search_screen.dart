import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/bloc/users_bloc.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_page.dart';

class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({super.key});

  @override
  State<UsersSearchScreen> createState() => _UsersSearchScreenState();
}

class _UsersSearchScreenState extends State<UsersSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return const UsersSearchPage();
      },
    );
  }
}
