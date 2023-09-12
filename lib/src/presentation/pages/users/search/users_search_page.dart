import 'package:flutter/material.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/user.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/users/widgets/user_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class UserSearchPage extends StatefulWidget {
  final User? user;
  final void Function(String?)? onClickUserSearchEvent;
  final void Function(bool?)? onUserLoading;
  final int? quantityFound;
  final String? message;
  const UserSearchPage(
      {super.key,
      this.user,
      this.onClickUserSearchEvent,
      this.quantityFound,
      this.message,
      this.onUserLoading});
  @override
  State<UserSearchPage> createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  String? searchTerm = '';
  var formatter = NumberFormat.compact(locale: locale);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        bottom: CustomAppBarBottom(
          onChanged: (search) {
            searchTerm = search;
            widget.onClickUserSearchEvent?.call(search);
          },
          onPressed: () {
            widget.onClickUserSearchEvent?.call(searchTerm);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: context.locales
                      .resultHeader(formatter.format(widget.quantityFound)),
                  textAlign: TextAlign.start,
                  style: TypographyType.header,
                ),
                CustomText(
                    text: widget.message ?? '', style: TypographyType.title),
                const SizedBox(height: Spacing.s32),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 320,
                      mainAxisSpacing: Spacing.s8,
                      crossAxisSpacing: Spacing.s8,
                    ),
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.user != null ? 1 : 0,
                    itemBuilder: (context, index) {
                      final result = widget.user!;
                      return Flexible(
                          child: UserListTile(
                        user: result,
                        onTap: () {
                          context.goNamed(AppRoute.userDetails.name);
                        },
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
