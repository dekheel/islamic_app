import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/settings/Theme_bottom_sheet.dart';
import 'package:islami_app/home/settings/language_bottom_sheet.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: .15,
                      child: ShowLanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == "en"
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: provider.isDarkMode()
                                ? MyTheme.blackColor
                                : MyTheme.whiteColor,
                          )),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    // color: MyTheme.primaryLightColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: .15,
                      child: ShowThemeBottomSheet(),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.yellowColor
                    : MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: provider.isDarkMode()
                                ? MyTheme.blackColor
                                : MyTheme.whiteColor,
                          )),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
