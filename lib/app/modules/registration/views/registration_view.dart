import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/app/common_widgets/edit_text.dart';
import 'package:final_project/app/common_widgets/heading_text.dart';
import '../../../common_widgets/button.dart';
import '../../../common_widgets/text_view.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';
import 'package:final_project/app/common_widgets/password_edit_text.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 844,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Stack(
                children: [
                  // Add the missing image here
                  Image.asset(
                    'assets/images/Laptop.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 469,
                  ),

                  Positioned(
                    left: 0,
                    top: 439,
                    child: Container(
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          HeadingText(text: 'Register Now', marginTop: 45),
                          EditText(
                            text: 'Enter Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.email,
                          ),
                          // Use PasswordEditText widget for password input
                          PasswordEditText(
                            text: 'Enter Password',
                            textInputType: TextInputType.visiblePassword,
                            textEditingController: controller.password,
                          ),
                          Button(
                            text: 'Register Now',
                            onClick: () {
                              controller.registration();
                            },
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: 'Already have an account ',
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                TextView(
                                  text: ' Login Now',
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
