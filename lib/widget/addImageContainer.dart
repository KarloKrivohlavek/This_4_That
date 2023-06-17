import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class addImageContainer extends StatefulWidget {
  addImageContainer({
    super.key,
    required this.image,
  });

  File? image;

  @override
  State<addImageContainer> createState() => _addImageContainerState();
}

class _addImageContainerState extends State<addImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.orange)),
      child: widget.image != null
          ? Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(
                        image: FileImage(widget.image!),
                        fit: BoxFit.cover,
                        scale: 5),
                    border: Border.all(color: Colors.orange)),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      color: Colors.orange),
                  child: const Icon(
                    MdiIcons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ])
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orange),
                ),
                child: const Icon(
                  MdiIcons.plus,
                  color: Colors.orange,
                ),
              ),
            ),
    );
  }
}
