import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeeth/hadeeth_tab.dart';
import 'package:islami_app/home/hadeeth/hadeth_details_screen.dart';

class ItemHadethName extends StatelessWidget {
  final HadethSubject hadeth;

  const ItemHadethName({required this.hadeth, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
