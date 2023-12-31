import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/borders.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/skill.dart';
import 'package:github_discover/src/presentation/components/checkbox.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class SkillListTile extends StatelessWidget {
  final Skill skill;
  final VoidCallback onDeletedPressed;
  final VoidCallback onUpdatedPressed;

  const SkillListTile({
    required this.skill,
    required this.onDeletedPressed,
    required this.onUpdatedPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDeletedPressed(),
      background: Container(
        decoration: borderCard(context.colors.kAlertDangerColor),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: Spacing.s20),
        child: CustomIcon(
          iconPath: Asset.trashIcon,
          color: context.colors.kWhiteColor,
        ),
      ),
      child: Container(
        decoration: borderCard(context.colors.kBackgrounSubtleColor),
        margin: const EdgeInsets.only(bottom: Spacing.s8),
        child: ListTile(
          title: CustomText(
            text: skill.title,
            style: TypographyType.body,
            textDecoration: skill.isCompleted ?? false,
          ),
          subtitle: CustomText(
            text: skill.description,
            style: TypographyType.body,
            textDecoration: skill.isCompleted ?? false,
          ),
          leading: CustomCheckbox(
            initialValue: skill.isCompleted ?? false,
            onChanged: (_) => onUpdatedPressed(),
          ),
        ),
      ),
    );
  }
}
