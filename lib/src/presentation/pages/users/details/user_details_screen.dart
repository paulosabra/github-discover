import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/presentation/blocs/userDetails/user_details_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/details/user_details_page.dart';

class _UserDetailsScreen extends StatefulWidget {
  const _UserDetailsScreen({super.key});

  @override
  State<_UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<_UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {

        if(state is UserDetailsStateLoadingState) {
          return const CustomLoader();
        }

        if (state is UserDetailsStateErrorState) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.message ?? '',
          );
        }


        return UserDetailsPage();
      },
    );
  }
}