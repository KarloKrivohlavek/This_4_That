import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddItemPage2 extends StatefulWidget {
  @override
  State<AddItemPage2> createState() => _AddItemPage2State();
}

class _AddItemPage2State extends State<AddItemPage2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dodaj slike predmeta',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Biste li sami uzeli predmet bez slike? Pokažite ostalima što nudite.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 3, color: Colors.grey), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelText: 'Unesi ime proizvoda'),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 120,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: Colors.grey), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: 'Opis predmeta'),
            ),
          ),
        ],
      ),
    );
  }
}
