import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth/hadeeth_tab.dart';
import 'package:islami_app/home/hadeeth/item_hadeth_details.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetailsScreen";

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HadethSubject args =
        ModalRoute.of(context)?.settings.arguments as HadethSubject;
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset("assets/images/bg.png")
            : Image.asset("assets/images/background_light.png"),
        Scaffold(
          appBar: AppBar(
              title: Text(
            args.title,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.1, horizontal: size.width * 0.05),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.primaryDarkColor.withOpacity(0.8)
                    : MyTheme.whiteColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return HadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        )
      ],
    );
  }
}
