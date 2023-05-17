import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: Color(0xFFF2C14E80),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              children: [
                Text('Riješi se viška stvari i nađi nešto zanimljivo'),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      child: Row(
                        children: []
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
