import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:this_4_that/constants/colors.dart';

class AddItemPage2 extends StatefulWidget {
  const AddItemPage2({super.key});

  @override
  State<AddItemPage2> createState() => _AddItemPage2State();
}

class _AddItemPage2State extends State<AddItemPage2> {
  final FocusNode node1 = FocusNode();
  final FocusNode node2 = FocusNode();
  final titleController = TextEditingController();
  @override
  void initState() {
    super.initState();

    titleController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Napišite nešto o predmetu',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onTap: () {
                FocusScope.of(context).requestFocus(node1);
              },
              focusNode: node1,
              controller: titleController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: MyColors.grey),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: MyColors.orange),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Naslov predmeta',
                  suffixIcon: titleController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: MyColors.grey,
                          ),
                          onPressed: () {
                            titleController.clear();
                          },
                        )),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 120,
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(node2);
                },
                focusNode: node2,
                maxLines: 9,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MyColors.grey),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: MyColors.orange),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Opis predmeta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
