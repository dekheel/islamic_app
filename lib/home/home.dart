import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeeth/hadeeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';
import 'package:islami_app/home/settings/setting_tab.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> homeBody = [
    QuranHome(),
    HadeethHome(),
    const SebhaHome(),
    const RadioHome(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset("assets/images/bg.png")
            : Image.asset("assets/images/background_light.png"),
        Scaffold(
          appBar: AppBar(
              title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/moshaf_blue.png"),
                    ),
                    label: AppLocalizations.of(context)!.quran_tab,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadeeth.png")),
                    label: AppLocalizations.of(context)!.hadeth_tab,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                    label: AppLocalizations.of(context)!.sebha_tab,
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio_blue.png")),
                    label: AppLocalizations.of(context)!.radio_tab,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                  ),
                ]),
          ),
          body: homeBody[selectedIndex],
        )
      ],
    );
  }
}
