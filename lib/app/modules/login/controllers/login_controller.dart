import 'package:get/get.dart';
import 'package:aisha_crud2/app/modules/dashboard/views/dashboard_view.dart';
import 'package:aisha_crud2/app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
final _getConnect = GetConnect();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final authToken = GetStorage();//TODO: Implement LoginController



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
passwordController.dispose();

    super.onClose();
  }

 void loginNow() async { //fungsi _loginNow() dengan deklarasi kata kunci async
    final response = await _getConnect.post(BaseUrl.login, {
      'email': emailController.text, 
      'password': passwordController.text, 
    });

    if (response.statusCode == 200) {
      authToken.write('token', response.body['token']); 
      Get.offAll(() => const DashboardView());
    } else { 
      Get.snackbar(
        'Error',
        response.body['error'].toString(), 
        icon: const Icon(Icons.error), 
        backgroundColor: Colors.red, 
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn, 
        margin: const EdgeInsets.only( 
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    }
  }


}
