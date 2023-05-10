import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddItemPage4 extends StatefulWidget {
  @override
  State<AddItemPage4> createState() => _AddItemPage4State();
}

class _AddItemPage4State extends State<AddItemPage4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Koliko vrije?',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ovo nam pomaže u filtriranju kako bi te spojili s predmetima slične vrijednosti.',
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
