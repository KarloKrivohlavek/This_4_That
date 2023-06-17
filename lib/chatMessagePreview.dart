import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:this_4_that/constants/colors.dart';

class MessagePreview extends StatelessWidget {
  const MessagePreview(
      {Key? key,
      required this.differentUserItemName,
      required this.differentUserName,
      required this.currentUserItemImage,
      required this.differentUserItemImage});

  final String currentUserItemImage;
  final String differentUserItemImage;
  final String differentUserName;
  final String differentUserItemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  // margin: EdgeInsets.only(right: 60),
                  width: 120.w,
                  height: 80.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(currentUserItemImage).image,
                            ),
                          ),
                          width: 48,
                          height: 48,
                        ),
                      ),
                      Positioned(
                        left: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  Image.network(differentUserItemImage).image,
                            ),
                          ),
                          width: 64,
                          height: 64,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.orange,
                          ),
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'images/logo.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(left: 110, top: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            differentUserItemName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(differentUserName),
                          // Text(
                          //   'Nova Poruka',
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          //   overflow: TextOverflow.ellipsis,
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    );
  }
}
