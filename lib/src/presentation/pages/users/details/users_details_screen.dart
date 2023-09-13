import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/mock/user_mock.dart';
import 'package:github_discover/src/presentation/blocs/users/details/users_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/details/users_details_page.dart';

class UsersDetailScreen extends StatefulWidget {
  const UsersDetailScreen({super.key});


  @override
  State<UsersDetailScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UsersDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsUserBloc, DetailsUsersState>(
      builder: (context, state) {
        if (state is DetailsUsersInitial) {
          return const CustomLoader();
        }

        if (state is DetailsUsersError) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.error,
          );
        }

        return UsersDetailsPage(
          user: kUserMock,
        );
      },
    );
  }
}
