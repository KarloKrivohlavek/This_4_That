import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class NumberOfPagesIndicator extends StatelessWidget {
  NumberOfPagesIndicator(
      {super.key, required this.numberOfItems, required this.currentPosition});
  int currentPosition;
  int numberOfItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: numberOfItems,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: (MediaQuery.of(context).size.width * 0.8) / numberOfItems,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: currentPosition >= index
                      ? MyColors.orange
                      : MyColors.black),
            ),
          );
        });
  }
}
