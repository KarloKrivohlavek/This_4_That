import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class FilterWidgetPreview extends StatelessWidget {
  const FilterWidgetPreview(
      {super.key, required this.filterType, required this.filterValue});
  final String filterType;
  final String filterValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      color: MyColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            filterType,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            filterValue,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
