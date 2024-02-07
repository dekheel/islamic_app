import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioHome extends StatelessWidget {
  const RadioHome({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset("assets/images/radioPhoto.png"),
          ),
          Text(
            AppLocalizations.of(context)!.holy_quran_radio,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage("assets/images/iconPlayNext.png"),
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.primaryLightColor,
                    size: 23),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage("assets/images/iconPlay.png"),
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.primaryLightColor,
                    size: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage("assets/images/iconPlayBack.png"),
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.primaryLightColor,
                    size: 23),
              )
            ],
          )
        ],
      ),
    );
  }
}
