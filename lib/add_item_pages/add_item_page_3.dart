import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddItemPage3 extends StatefulWidget {
  @override
  State<AddItemPage3> createState() => _AddItemPage3State();
}

class _AddItemPage3State extends State<AddItemPage3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Koje je kategorije?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ovo nam pomaže u filtriranju da bi ostali lakše pronašli tvoj predmet.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
