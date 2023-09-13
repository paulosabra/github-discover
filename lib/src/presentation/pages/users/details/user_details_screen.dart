import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/users/detail/detail_users_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailUsersBloc, DetailUsersState>(
      builder: (context, state) {
        if (state is DetailUsersInitial) {
          return const CustomLoader();
        }
        if (state is DetailUsersLoading) {
          return const CustomLoader();
        }

        if (state is DetailUsersError) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.errorMessage,
          );
        }

        return UserDetailsPage(
          user: state.user!,
        );
      },
    );
  }
}
