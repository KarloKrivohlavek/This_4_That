import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_2_name_surname.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen1Login extends StatefulWidget {
  const AuthentificationScreen1Login({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen1Login> createState() =>
      _AuthentificationScreen1LoginState();
}

class _AuthentificationScreen1LoginState
    extends State<AuthentificationScreen1Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Color(0x80F2C14E),
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
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
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AuthentificationScreen2NameSurname()),
                      );
                      // signInWithGogle();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: MyColors.black, width: 1)),
                      child: Row(children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('images/google_logo.png'),
                        ),
                        SizedBox(width: 20),
                        Text(
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

//   Future<void> googleSignIn() async {
//     await firebaseService.signInWithGoogle();
// // firebaseService je neka varijabla koju inicijaliziraš prije u varijablama kao final firebaseService = Get.find<FirebaseService();
//
//     // todo: napisati što nakon što se user prijavi, gdje ga treba preusmjeriti dalje, ima li još nešto što se treba napraviti nakon prijave itd.
//   }

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
