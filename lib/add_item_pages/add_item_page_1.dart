import 'dart:io';
import 'package:this_4_that/add_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/addImageContainer.dart';

class AddItemPage1 extends StatefulWidget {
  @override
  State<AddItemPage1> createState() => _AddItemPage1State();
}

class _AddItemPage1State extends State<AddItemPage1> {
  File? image;
  List<File?> imageList = [null];
  Future pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      print(image);
      print(pickedImage);
      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage!.path);
      setState(() {
        image = imageTemporary;
        if (imageList.length < 4) {
          imageList.insert(0, image);
          print(image);
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

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
          TextButton(
            onPressed: () {
              pickImage();
            },
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.7,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                    onTap: () {
                      if (imageList.elementAt(index) != null) {
                        setState(() {
                          imageList.removeAt(index);
                        });
                      } else {
                        pickImage();
                      }
                    },
                    child: addImageContainer(image: imageList[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
