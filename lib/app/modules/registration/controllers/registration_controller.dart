
// import 'package:get/get.dart';
// import 'package:final_project/app/data/response/reg_response.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:final_project/app/utilities/auth_repo.dart';

// class RegistrationController extends GetxController {
// final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   bool _isLoading = false;
//   bool showPassword = true;
//   AuthRepo authRepo = AuthRepo();
  
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//    @override
//   void onClose() {
//     super.onClose();
//   }

//   Future registration() async {
//     String emailAddress = email.text;
//     String psw = password.text;
//     print(emailAddress);
//     print(psw);
//     if (emailAddress.isEmpty) {
      
//      return Get.snackbar('Warning!', 'Email is Empty');
    
//     }
//      else if (psw.isEmpty) {

//      return Get.snackbar('Warning', 'Password is Empty');
//     }
//     RegResponse? regResponse = await authRepo.registraion(email: emailAddress, password: psw);
//     if (regResponse != null) {
//      if (regResponse.token!=null) {
//        Get.snackbar('Success!', 'Registration Successful ${regResponse.token}');
//      }
//      if(regResponse.error!=null){
//        Get.snackbar('Failed!', 'Registration Failed ${regResponse.error}');
//      }
//     }else{
//        Get.snackbar('Failed!', 'Registration Failed, No Data');
//     }
    
//   }

//   void showPasswordVisibility() {
//     showPassword = !showPassword;
//    // update(); // Call update to update the UI when the password visibility changes.
//   }
// }
import 'package:get/get.dart';
import 'package:final_project/app/data/response/reg_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_project/app/utilities/auth_repo.dart';

class RegistrationController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isLoading = false;
  bool showPassword = true;
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

  Future<void> registration() async {
    String emailAddress = email.text;
    String psw = password.text;
    print(emailAddress);
    print(psw);
    if (emailAddress.isEmpty) {
      Get.snackbar('Warning!', 'Email is Empty');
      return;
    } else if (psw.isEmpty) {
      Get.snackbar('Warning', 'Password is Empty');
      return;
    }

    RegResponse? regResponse = await authRepo.registraion(email: emailAddress, password: psw);
    if (regResponse != null) {
      if (regResponse.token != null) {
        Get.snackbar('Success!', 'Registration Successful ${regResponse.token}');
      } else if (regResponse.error != null) {
        Get.snackbar('Failed!', 'Registration Failed ${regResponse.error}');
      }
    } else {
      Get.snackbar('Failed!', 'Registration Failed, No Data');
    }
  }

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    update(); // Call update to update the UI when the password visibility changes.
  }
}
