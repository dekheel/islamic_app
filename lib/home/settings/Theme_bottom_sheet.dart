import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeBottomSheet extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode()
                ? getUnSelectedItemLanguage(
                    context, AppLocalizations.of(context)!.light)
                : getSelectedItemLanguage(
                    context, AppLocalizations.of(context)!.light),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode()
                ? getSelectedItemLanguage(
                    context, AppLocalizations.of(context)!.dark)
                : getUnSelectedItemLanguage(
                    context, AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemLanguage(BuildContext context, String theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
        Icon(
          Icons.check,
          size: 35,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemLanguage(BuildContext context, String theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(theme,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.blackColor)
                : Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
