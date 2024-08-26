import 'package:flutter/material.dart';

import '../../../../data/utils/app_styles/app_text_styles.dart';

Widget buildSettingsTile(
    {required BuildContext context,
    required String optionName,
    String? optionDescription,
    dynamic optionAction, Function()? onTap}) {
  return ListTile(
    title: Text(
      optionName,
      style: AppTextStyle.primaryTextStyle(),
    ),
    subtitle: optionDescription != null
        ? Text(
            optionDescription,
            style: AppTextStyle.secondaryTextStyle(
                color: Theme.of(context).hintColor),
          )
        : null,
    trailing: optionAction,
    onTap: onTap,
  );
}
