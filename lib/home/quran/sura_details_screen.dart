import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';
import 'package:islami_app/home/quran/item_sura_name.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset("assets/images/bg.png")
            : Image.asset("assets/images/background_light.png"),
        Scaffold(
          appBar: AppBar(
              title: Text(
            args.name,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.primaryLightColor))
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.1,
                      horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                      color: provider.isDarkMode()
                          ? MyTheme.primaryDarkColor.withOpacity(0.8)
                          : MyTheme.whiteColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25)),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return LineSuraDetails(
                          lineDetail: verses[index], index: index);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                          thickness: 1,
                          color: provider.isDarkMode()
                              ? MyTheme.yellowColor
                              : MyTheme.primaryLightColor);
                    },
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = content.split("\n");
    setState(() {});
  }
}
