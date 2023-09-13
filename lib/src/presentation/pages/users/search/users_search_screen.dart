import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/blocs/users/details/users_details_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/users_search_bloc.dart';
import 'package:github_discover/src/presentation/components/empty_state.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_page.dart';
import 'package:go_router/go_router.dart';

class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({super.key});

  @override
  State<UsersSearchScreen> createState() => _UsersSearchScreenState();
}

class _UsersSearchScreenState extends State<UsersSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersSearchBloc, UsersSearchState>(
      builder: (context, state) {
        if (state is UsersSearchLoadingState) {
          return const CustomLoader();
        }

        if (state is UsersSearchEmptyState) {}

        if (state is UsersSearchErrorState) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.message,
          );
        }

        return UsersSearchPage(
          users: state.users,
          onSearch: (String searchString) {
            context
                .read<UsersSearchBloc>()
                .add(UserSearchEvent(searchString: searchString));
          },
          onDetailTap: (User user) {
            context.read<UsersDetailsBloc>().add(UserLoadingEvent(user: user));
            context.goNamed(AppRoute.userDetails.name);
          },
        );
      },
    );
  }
}
