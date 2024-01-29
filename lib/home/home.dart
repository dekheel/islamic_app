import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth/hadeeth.dart';
import 'package:islami_app/home/quran/quran.dart';
import 'package:islami_app/home/radio/radio.dart';
import 'package:islami_app/home/sebha/sebha.dart';
import 'package:islami_app/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> homeBody = [
    QuranHome(),
    HadeethHome(),
    SebhaHome(),
    RadioHome()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background_light.png"),
        Scaffold(
          appBar: AppBar(
              title: Text(
            "Islamic",
            style: Theme.of(context).textTheme.titleLarge,
          )),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyTheme.primaryLightColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                    label: 'Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/hadeeth.png")),
                    label: 'Hadeeth',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio_blue.png")),
                    label: 'Radio',
                  ),
                ]),
          ),
          body: homeBody[selectedIndex],
        )
      ],
    );
  }
}
