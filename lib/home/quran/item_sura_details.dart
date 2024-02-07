import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LineSuraDetails extends StatelessWidget {
  final String lineDetail;
  final int index;

  const LineSuraDetails(
      {required this.lineDetail, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$lineDetail {${index + 1}}",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: provider.isDarkMode()
                ? MyTheme.yellowColor
                : MyTheme.blackColor),
      ),
    );
  }
}
