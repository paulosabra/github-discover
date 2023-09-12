import 'package:flutter/material.dart';
import 'package:github_discover/src/config/routes.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RepositoriesSearchPage extends StatefulWidget {
  final Repository? repository;
  final void Function(String?)? onClickRepositorySearchEvent;
  final void Function(bool?)? onRepositoryLoading;
  final int? quantityFound;
  final String? message;
  const RepositoriesSearchPage(
      {super.key,
      this.repository,
      this.onClickRepositorySearchEvent,
      this.quantityFound,
      this.message,
      this.onRepositoryLoading});
  @override
  State<RepositoriesSearchPage> createState() => _RepositoriesSearchPageState();
}

class _RepositoriesSearchPageState extends State<RepositoriesSearchPage> {
  String? searchTerm = '';
  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: locale);

    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        bottom: CustomAppBarBottom(
          onChanged: (search) {
            searchTerm = search;
            widget.onClickRepositorySearchEvent?.call(search);
          },
          onPressed: () {
            widget.onClickRepositorySearchEvent?.call(searchTerm);
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
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.repository != null ? 1 : 0,
                  itemBuilder: (context, index) {
                    final result = widget.repository!;
                    return RepositoryListTile(
                      repository: result,
                      onTap: () {
                        context.goNamed(AppRoute.repositoryDetails.name);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
