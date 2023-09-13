import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/mock/repository_mock.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/responsive_column_layout.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/repository_list_tile.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/user_card.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:go_router/go_router.dart';

class UserDetailsPage extends StatefulWidget {
  final User? user;
  final String? message;
  const UserDetailsPage({
    super.key,
    this.user,
    this.message,
  });

  @override
  State<UserDetailsPage> createState() => _UserDetailsPage();
}

class _UserDetailsPage extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    User user = widget.user!;

    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        text: user.name?.toUpperCase(),
        hasBackButton: true,
        backButtonPressed: () => context.pop(),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s16),
            child: ResponsiveColumnLayout(
              startContent: UserCard(
                user: user,
              ),
              endContent: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const RepositoryListTile(
                    repository: kRepositoryMock,
                  );
                },
              ),
              spacing: Spacing.s16,
            ),
          ),
        ),
      ),
    );
  }
}
