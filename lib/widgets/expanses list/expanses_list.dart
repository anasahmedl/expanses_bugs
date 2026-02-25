import 'dart:math';
import 'package:expenses_app/Models/expanses.dart';
import 'package:expenses_app/widgets/expanses list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
    super.key,
    required this.expanses,
    required this.onRemoveExpanses,
  });

  final List<Expansesmodel> expanses;
  final Function(Expansesmodel) onRemoveExpanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) => Dismissible(

        key: ValueKey(expanses[index].id),

        background: Container(
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
        ),
        
                // 🐞 BUG: دايمًا بيمسح أول عنصر

        onDismissed: (direction) => onRemoveExpanses(expanses[index]),
        child: expansesItem(expanses: expanses[index]),
      ),
    );
  }
}