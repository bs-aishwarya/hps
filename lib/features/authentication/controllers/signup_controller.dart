import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hps/data/repositories/auth_repositories.dart';
import 'package:hps/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:hps/utils/constants/images_strings.dart';
import 'package:hps/utils/constants/text_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final AuthRepository _auth = AuthRepository();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  Rx<bool> signUpPasswordObscureText = true.obs;
  Rx<bool> signUpConfirmPasswordObscureText = true.obs;

  String get emailString => email.text;
  String get passwordString => password.text;
  String get confirmPasswordString => confirmPassword.text;

  void toggleSignUpPasswordObscureText() {
    SignupController.instance.signUpPasswordObscureText.value =
        !SignupController.instance.signUpPasswordObscureText.value;
  }

  void toggleSignUpConfirmPasswordObscureText() {
    SignupController.instance.signUpConfirmPasswordObscureText.value =
        !SignupController.instance.signUpConfirmPasswordObscureText.value;
  }

  void signup() async {
    if (passwordString != confirmPasswordString) {
      debugPrint("Password & Confirm Password doesn't match");
      return null;
    }

    debugPrint("Signing up...");
    _auth.signUpWithEmailAndPassword(
      emailString,
      passwordString,
      () => Get.to(
        () => VerifyAuthentication(
          buttonText: MyAppTexts.resendEmail,
          image: MyAppImages.email_verification,
          title: "Verify Your Email",
          subtitle:
              "Go to your G-Mail and click on the link to verify your account.",
        ),
      ),
    );
  }
}
