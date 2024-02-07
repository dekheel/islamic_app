import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';

class ItemSuraName extends StatelessWidget {
  final String suraName;
  final int index;

  const ItemSuraName({required this.suraName, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: suraName, index: index));
      },
      child: Text(
        suraName,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class SuraDetailsArgs {
  final String name;

  final int index;

  const SuraDetailsArgs({required this.name, required this.index});
}
