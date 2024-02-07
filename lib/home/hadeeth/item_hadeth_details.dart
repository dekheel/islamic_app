import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  final String content;

  const HadethDetails({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.blackColor),
      ),
    );
  }
}
