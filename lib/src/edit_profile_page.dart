// import 'dart:io';
//
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:this_4_that/data.dart';
// import 'package:this_4_that/user.dart';
// import 'package:this_4_that/user_preferences.dart';
// import 'package:this_4_that/widget/appbar_widget.dart';
// import 'package:this_4_that/widget/numbers_widget.dart';
// import 'package:this_4_that/widget/profile_widget.dart';
// import 'package:this_4_that/widget/textfield_widget.dart';
// import 'package:path/path.dart';
//
// import '../user.dart';
// import '../user_preferences.dart';
// import '../widget/button_widget.dart';
// import '../widget/profile_widget.dart';
// import '../widget/textfield_widget.dart';
//
// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   late User user;
//
//   @override
//   void initState() {
//     super.initState();
//
//     user = UserPreferences.getUser();
//   }
//
//   @override
//   Widget build(BuildContext context) => Builder(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.orange,
//           ),
//           body: ListView(
//             padding: EdgeInsets.symmetric(horizontal: 32),
//             physics: BouncingScrollPhysics(),
//             children: [
//               ProfileWidget(
//                 imagePath: user.imagePath.toString(),
//                 isEdit: true,
//                 onClicked: () async {
//                   final image = await ImagePicker()
//                       .pickImage(source: ImageSource.gallery);
//
//                   if (image == null) return;
//
//                   final directory = await getApplicationDocumentsDirectory();
//                   final name = basename(image.path);
//                   final imageFile = File('${directory.path}/$name');
//                   final newImage = await File(image.path).copy(imageFile.path);
//
//                   setState(() => user = user.copy(imagePath: newImage.path));
//                 },
//               ),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'Full Name',
//                 text: currentUser.name,
//                 onChanged: (name) {
//                   currentUser = currentUser.copy(name: name);
//                 },
//               ),
//               const SizedBox(height: 24),
//               const SizedBox(height: 24),
//               TextFieldWidget(
//                 label: 'O meni',
//                 text: user.about,
//                 maxLines: 5,
//                 onChanged: (about) => user = user.copy(about: about),
//               ),
//               const SizedBox(height: 24),
//               ButtonWidget(
//                 color: Colors.black,
//                 text: 'Save',
//                 onClicked: () {
//                   UserPreferences.setUser(currentUser);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
// }
