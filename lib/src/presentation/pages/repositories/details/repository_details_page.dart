import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_card.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:go_router/go_router.dart';

class RepositoryDetailsPage extends StatefulWidget {
  final Repository repository;
  const RepositoryDetailsPage({
    super.key,
    required this.repository,
  });

  @override
  State<RepositoryDetailsPage> createState() => _RepositoryDetailsPageState();
}

class _RepositoryDetailsPageState extends State<RepositoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        text: widget.repository.name?.toUpperCase(),
        hasBackButton: true,
        backButtonPressed: () => context.pop(),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Spacing.s24),
          width: MediaQuery.sizeOf(context).width,
          child: RepositoryCard(repository: widget.repository),
        ),
      ),
    );
  }
}
