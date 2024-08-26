import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_analytica_task_app/data/utils/routes/app_routes.dart';

import '../data/api/api_services/auth_service.dart';
import '../data/utils/widgets/helper.dart';

class AuthController extends GetxController {
  final RxBool wantToSignUp = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GetStorage _storage = GetStorage();

  // Sign In Method
  Future<void> signIn() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();

    try {
      User? user = await AuthService.signInWithEmail(email, password);
      if (user != null) {
        _storage.write('isLoggedIn', true);
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Helper.showToast(msg: "Sign in failed. Please try again.");
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        case 'user-disabled':
          errorMessage = "This user has been disabled. Please contact support.";
          break;
        case 'user-not-found':
          errorMessage = "No user found with this email address.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password. Please try again.";
          break;
        default:
          errorMessage = "Sign in failed. Please try again later.";
          break;
      }

      Helper.showToast(msg: errorMessage);
    } catch (e) {
      Helper.showToast(msg: "An unexpected error occurred: $e");
    }
  }

  // Register Method
  Future<void> signUp() async {
    String email = emailController.text.trim();
    String password = passController.text.trim();
    String fullName = fullNameController.text.trim();

    try {
      User? user = await AuthService.registerWithEmail(email, password);
      if (user != null) {
        _storage.write('isLoggedIn', true);
        // You can also add user information to Firestore here if needed
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        Helper.showToast(msg: "Sign up failed. Please try again.");
      }
    } catch (e) {
      Helper.showToast(msg: "Sign up failed: $e");
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    try {
      await AuthService.signOut();
      _storage.remove('isLoggedIn');
      Get.offAllNamed(AppRoutes.authScreen);
    } catch (e) {
      Helper.showToast(msg: "Sign out failed: $e");
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleSignUpMode() {
    wantToSignUp.value = !wantToSignUp.value;
  }

  String initialRoute () {
    String initialRoute = _storage.read('isLoggedIn') == true
        ? AppRoutes.homeScreen
        : AppRoutes.authScreen;
    return initialRoute;
  }

}
