import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/assets.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/presentation/components/icon.dart';
import 'package:github_discover/src/presentation/components/logo.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final String? text;
  final bool hasBackButton;
  final VoidCallback? backButtonPressed;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    Key? key,
    this.text,
    this.backButtonPressed,
    this.hasBackButton = false,
    this.bottom,
  })  : preferredSize = Size.fromHeight(
            bottom == null ? kToolbarHeight : kToolbarHeight * 2.5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.colors.kBackgrounSubtleColor,
      centerTitle: true,
      elevation: Spacing.s0,
      surfaceTintColor: Colors.transparent,
      bottom: bottom,
      leading: hasBackButton
          ? GestureDetector(
              onTap: () {
                if (backButtonPressed != null) {
                  backButtonPressed!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: const CustomIcon(
                iconPath: Asset.arrowLeftIcon,
              ),
            )
          : Container(),
      title: text == null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLogo(
                  pathDark: Logo.logoWhite,
                  pathLight: Logo.logo,
                  height: kToolbarHeight,
                ),
                CustomText(
                  text: context.locales.discoverAppBar,
                  color: context.colors.kForegroundColor,
                  style: TypographyType.title,
                ),
              ],
            )
          : CustomText(
              text: text!,
              color: context.colors.kForegroundColor,
              style: TypographyType.title,
            ),
    );
  }
}
