import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_discover/src/presentation/blocs/user_search/user_search_bloc.dart';
import 'package:github_discover/src/presentation/components/loader.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_page.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSearchBloc, UserSearchState>(
      builder: (context, state) {
        if (state is UserSearchLoadingState) {
          return const CustomLoader();
        }

        if (state is UserSearchErrorState) {
          return UserSearchPage(
            message: state.message,
            user: null,
            quantityFound: 0,
            onClickUserSearchEvent: (userName) {
              context
                  .read<UserSearchBloc>()
                  .add(UserSearchQueryEvent(enteredValue: userName ?? ''));
            },
          );
        }

        if (state is UserSearchEmptyState) {
          return UserSearchPage(
            message: state.message,
            user: null,
            quantityFound: 0,
            onClickUserSearchEvent: (userName) {
              context
                  .read<UserSearchBloc>()
                  .add(UserSearchQueryEvent(enteredValue: userName ?? ''));
            },
          );
        }

        return UserSearchPage(
          user: state.user,
          quantityFound: state.quantityFound ?? 0,
          onClickUserSearchEvent: (userName) {
            context
                .read<UserSearchBloc>()
                .add(UserSearchQueryEvent(enteredValue: userName ?? ''));
          },
        );
      },
    );
  }
}
