import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:this_4_that/authentification_screens/authentification_controller.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';


class AuthentificationScreen1Login extends GetView<AuthentificationController> {
  const AuthentificationScreen1Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: const Color(0x80F2C14E),
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Center(child: Image.asset('images/login_image.png')),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    right: MediaQuery.of(context).size.width * 0.42,
                    child: Image.asset(
                      'images/logo_orange.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    MyStrings.authscreen1text,
                    style: MyTextStyles.poppins24w700,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextButton(
                    onPressed: () {
                      controller.googleSignIn();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: MyColors.black, width: 1)),
                      child: Row(children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('images/google_logo.png'),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Nastavi koristeći Google',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.black),
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // signInWithGogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //   print(userCredential.user?.displayName);
  // }
}
