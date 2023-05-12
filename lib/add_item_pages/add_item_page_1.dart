import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/addImageContainer.dart';

class AddItemPage1 extends StatefulWidget {
  const AddItemPage1({super.key});

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

      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage!.path);
      setState(() {
        image = imageTemporary;
        if (imageList.length < 5) {
          imageList.insert(0, image);
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dodaj slike predmeta',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Biste li sami uzeli predmet bez slike? Pokažite ostalima što nudite.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
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
              itemCount: imageList.length < 5 ? imageList.length : 4,
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
