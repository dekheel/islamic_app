import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeeth/item_hadeth_name.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadeethHome extends StatefulWidget {
  HadeethHome({super.key});

  @override
  State<HadeethHome> createState() => _HadeethHomeState();
}

class _HadeethHomeState extends State<HadeethHome> {
  List<HadethSubject> ahadethsubjectList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (ahadethsubjectList.isEmpty) {
      loadFiles();
    }

    return Column(
      children: [
        Center(child: Image.asset("assets/images/hadeethPhoto.png")),
        Divider(
            thickness: 3,
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.primaryLightColor),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
            thickness: 3,
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.primaryLightColor),
        ahadethsubjectList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: provider.isDarkMode()
                      ? MyTheme.yellowColor
                      : MyTheme.primaryLightColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemHadethName(hadeth: ahadethsubjectList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                          thickness: 2,
                          color: provider.isDarkMode()
                              ? MyTheme.yellowColor
                              : MyTheme.primaryLightColor);
                    },
                    itemCount: ahadethsubjectList.length),
              )
      ],
    );
  }

  void loadFiles() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = content.split("#\r\n");

    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split("\n");
      String ahadethTitleList = hadethLines[0];
      hadethLines.removeAt(0);

      HadethSubject hadethSubject =
          HadethSubject(title: ahadethTitleList, content: hadethLines);
      ahadethsubjectList.add(hadethSubject);
      setState(() {});
    }
  }
}

class HadethSubject {
  final String title;
  final List<String> content;

  const HadethSubject({required this.title, required this.content});
}
