import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';

import '../../../blocs/details_user/details_user_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsUserBloc, DetailsUserState>(
      builder: (context, state) {
        if (state is DetailsUserErrorState) {
          return UserDetailsPage(
            message: state.message,
            user: null,
          );
        }

        return const UserDetailsPage(
          user: kUserMock,
          message: null,
        );
      },
    );
  }
}