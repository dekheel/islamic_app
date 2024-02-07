import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaHome extends StatefulWidget {
  const SebhaHome({super.key});

  @override
  State<SebhaHome> createState() => _SebhaHomeState();
}

class _SebhaHomeState extends State<SebhaHome> {
  double degrees = .10;
  int tasbeehCounter = 0;
  int tasbeehindex = 0;

  List<String> tasbeehWords = [];

  double L = 300; // image side length
  double R = 24; // rounding radius

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    tasbeehWords.add(AppLocalizations.of(context)!.subhan_allah);
    tasbeehWords.add(AppLocalizations.of(context)!.hamd_llah);
    tasbeehWords.add(AppLocalizations.of(context)!.allah_akbr);

    var provider = Provider.of<AppConfigProvider>(context);

    return Column(children: [
      Center(
        child: Stack(children: [
          Positioned(
            top: -176,
            left: 45,
            right: 0,
            bottom: 0,
            child: provider.isDarkMode()
                ? Image.asset(
                    "assets/images/head of seb7a dark.png",
                  )
                : Image.asset(
                    "assets/images/head of seb7a.png",
                  ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 110),
            child: InkWell(
              onTap: tasbeehFun,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(pi * degrees),
                child: provider.isDarkMode()
                    ? Image.asset(
                        "assets/images/body of seb7a dark.png",
                      )
                    : Image.asset(
                        "assets/images/body of seb7a.png",
                      ),
              ),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          AppLocalizations.of(context)!.number_of_praises,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      Container(
        width: screenSize.width * 0.169,
        height: screenSize.height * 0.09,
        decoration: BoxDecoration(
            color: provider.isDarkMode()
                ? MyTheme.primaryDarkColor.withOpacity(.50)
                : MyTheme.primaryLightColor.withOpacity(.50),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            "$tasbeehCounter",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontFamily: "Inter-Regular"),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 25),
        width: screenSize.width * 0.45,
        height: screenSize.height * 0.07,
        decoration: BoxDecoration(
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.primaryLightColor,
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            tasbeehWords[tasbeehindex],
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: "Inter-Regular",
                color: provider.isDarkMode() ? Colors.black : Colors.white),
          ),
        ),
      )
    ]);
  }

  void tasbeehFun() {
    if (degrees >= 100) {
      degrees = .10;
    } else {
      degrees += .10;
    }
    if (tasbeehCounter + 1 > 99) {
      tasbeehCounter = 1;
      tasbeehindex = 0;
    } else {
      tasbeehCounter++;
    }
    if (tasbeehCounter == 34 || tasbeehCounter == 67) {
      tasbeehindex++;
    }

    setState(() {});
  }
}
