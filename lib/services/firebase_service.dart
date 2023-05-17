// ignore_for_file: public_member_api_docs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

///
/// Service used for Firebase manipulation
/// Has lots of helper methods which ease our Firebase use
///

class FirebaseService<T> extends GetxService {
  ///
  /// CONSTRUCTOR
  ///

  final firestore = FirebaseFirestore.instance;

  FirebaseService();

  ///
  /// METHODS
  ///
}
