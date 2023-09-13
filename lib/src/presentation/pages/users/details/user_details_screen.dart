import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/mock/User_mock.dart';
import 'package:github_discover/src/presentation/blocs/user_details/user_details_bloc.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsSearchState();
}

class _UserDetailsSearchState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsLoadingState) {
          return const CustomLoader();
        }

        if (state is UserDetailsErrorState) {
          return const UserDetailsPage(
            message: "Error",
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
