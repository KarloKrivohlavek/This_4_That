import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_6_location.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/strings.dart';
import 'package:this_4_that/constants/text_styles.dart';
import 'package:this_4_that/widget/filled_color_button_widget.dart';
import 'package:this_4_that/widget/number_of_pages_indicator_widget.dart';

class AuthentificationScreen5Description extends StatefulWidget {
  const AuthentificationScreen5Description({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen5Description> createState() =>
      _AuthentificationScreen5DescriptionState();
}

class _AuthentificationScreen5DescriptionState
    extends State<AuthentificationScreen5Description> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                child: NumberOfPagesIndicator(
                  numberOfItems: 5,
                  currentPosition: 3,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Reci nam nešto o sebi',
                style: MyTextStyles.poppins40w700,
              ),
              SizedBox(height: 10),
              Text(
                'Ovo će biti prikazano javno na profilu',
                style: MyTextStyles.poppins16w400,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: TextField(
                  // onTap: () {
                  //   FocusScope.of(context).requestFocus(node2);
                  // },
                  // focusNode: node2,
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
                      hintText: 'Opis profila'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthentificationScreen6Location()),
                  );
                },
                child: FilledColorButtonWidget(
                  buttonHeight: 48.w,
                  buttonText: 'Dalje',
                  buttonWidth: MediaQuery.of(context).size.width,
                  isEnabled: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
