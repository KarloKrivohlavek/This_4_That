import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/constants/colors.dart';

import '../../chatMessagePreview.dart';
import 'messages_page_controller.dart';

///
/// This is a screen in which we write widgets concerning [HelloScreen]
///

class MessagesPageScreen extends GetView<MessagesPageController> {
  const MessagesPageScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: (Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.orange,
                            width: 3,
                          ),
                          color: controller.isActiveButton1On
                              ? MyColors.orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Razgovori',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      )),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: (Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.orange,
                            width: 3,
                          ),
                          color: controller.isActiveButton2On
                              ? MyColors.orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Matchevi',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      )),
// style: TextButton.styleFrom(
//   textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: (Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.orange,
                            width: 3,
                          ),
                          color: controller.isActiveButton3On
                              ? Colors.transparent
                              : MyColors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                            child: Text(
                          'Nove Poruke',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return const MessagePreview();
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
