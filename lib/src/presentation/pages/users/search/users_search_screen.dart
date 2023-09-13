import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/blocs/users/detail/detail_users_bloc.dart';
import 'package:github_discover/src/presentation/blocs/users/search/search_users_bloc.dart';
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
    return BlocBuilder<SearchUsersBloc, SearchUsersState>(
      builder: (context, state) {
        if (state is SearchUsersLoadingState) {
          return const CustomLoader();
        }

        if (state is SearchUsersEmptyState) {}

        if (state is SearchUsersErrorState) {
          return CustomEmptyState(
            iconPath: Asset.stopIcon,
            description: state.errorMessage,
          );
        }

        return UsersSearchPage(
          users: state.users,
          onSearch: (String searchString) {
            context
                .read<SearchUsersBloc>()
                .add(SearchUserEvent(searchString: searchString));
          },
          onDetailClick: (User user) {
            context.read<DetailUsersBloc>().add(LoadingUserEvent(user: user));
            context.goNamed(AppRoute.userDetails.name);
          },
        );
      },
    );
  }
}
