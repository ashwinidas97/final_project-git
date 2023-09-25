import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/app/data/response/login_response.dart';
import 'package:final_project/app/routes/app_pages.dart';
import 'package:final_project/app/utilities/auth_repo.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isLoading = false;
  AuthRepo authRepo = AuthRepo();

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
    super.onClose();
  }

  Future<void> login() async {
    String emailAddress = email.text;
    String psw = password.text;

    if (emailAddress.isEmpty) {
      Get.snackbar('Warning!', 'Email is Empty');
      return;
    } else if (psw.isEmpty) {
      Get.snackbar('Warning!', 'Password is Empty');
      return;
    }

    LoginResponse? loginResponse = await authRepo.login(email: emailAddress, password: psw);

    if (loginResponse != null) {
      if (loginResponse.token != null) {
        Get.snackbar('Title', 'Success', onTap: (snack) => Get.toNamed(Routes.HOME));
      } else if (loginResponse.error != null) {
        Get.snackbar('Failed!', 'Login Failed ${loginResponse.error}');
      }
    } else {
      Get.snackbar('Failed!', 'Login Failed, No Data');
    }
  }
}
