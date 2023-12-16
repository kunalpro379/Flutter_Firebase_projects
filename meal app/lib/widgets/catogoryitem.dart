import 'package:e_learningapp/Catogory.dart';
import 'package:flutter/material.dart';
import 'package:e_learningapp/widgets/catogoryitem.dart';

class CatogaryGridItem extends StatelessWidget {
  const CatogaryGridItem(
      {super.key, required this.catogory, required this.onSelectCategory});

  final Catogory catogory;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              catogory.color.withOpacity(1),
              catogory.color.withOpacity(0.5)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          catogory.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
