import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/constants/text_styles.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // Get.rawSnackbar(
      //     messageText: Text(
      //       'Niste povezani na internet',
      //       style: MyTextStyles.poppins40w700,
      //     ),
      //     isDismissible: false,
      //     duration: Duration(days: 1),
      //     snackStyle: SnackStyle.FLOATING,
      //     backgroundColor: MyColors.white,
      //     icon: ImageIcon(
      //       AssetImage('images/no_internet_connection.png'),
      //       size: 48,
      //     ));
      Get.defaultDialog(
          title: 'Niste povezani na internet',
          titleStyle: MyTextStyles.poppins40w700,
          barrierDismissible: false,
          middleText: 'Povežite se i pokušajte opet.',
          middleTextStyle: MyTextStyles.poppins16w400,
          content: Image.asset('images/no_internet_connection.png'));
    } else {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }
}
