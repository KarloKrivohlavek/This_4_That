import 'package:flutter/material.dart';
import 'package:this_4_that/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: 150,
      endIndent: 150,
      color: MyColors.orange,
      thickness: 2,
    );
  }
}
