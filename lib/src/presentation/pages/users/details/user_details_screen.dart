import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users_details/bloc/users_details_bloc.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';

class UsersDetailsScreen extends StatefulWidget {
  const UsersDetailsScreen({super.key});

  @override
  State<UsersDetailsScreen> createState() => _UsersDetailsScreenState();
}

class _UsersDetailsScreenState extends State<UsersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersDetailsBloc, UsersDetailsState>(
      builder: (context, state) {
        return const UserDetailsPage();
      },
    );
  }
}
