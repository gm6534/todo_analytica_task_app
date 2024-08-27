import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_analytica_task_app/data/utils/routes/app_routes.dart';
import '../data/api/api_services/auth_service.dart';
import '../data/api/api_services/firebase_service.dart';
import '../data/utils/widgets/helper.dart';
import '../model/firebase_user_model.dart';

class AuthController extends GetxController {
  final RxBool wantToSignUp = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GetStorage _storage = GetStorage();

  @override
  void onClose() {
    wantToSignUp.value = false;
    isPasswordVisible.value = false;
    isLoading.value = false;
    fullNameController.clear();
    emailController.clear();
    passController.clear();
    super.onClose();
  }


  Future<void> signUpWithEmail() async {
    if (formKey.currentState!.validate()) {
        isLoading.value = true;
      try {
        User? user = await AuthService.registerWithEmail(
          email: emailController.text.trim(),
          password: passController.text.trim(),);
        if (user != null) {
          await user.updateDisplayName(fullNameController.text.trim());

          // Create a UserModel instance
          UserModel userModel = UserModel(
            displayName: fullNameController.text.trim(),
            email: emailController.text.trim(),
            uid: user.uid
          );

          // Save user record to FireStore
          await FirebaseFireStoreService.addDocument(collectionPath: "Users", data: userModel.toJson());

          _storage.write('isLoggedIn', true);
          Get.offAllNamed(AppRoutes.homeScreen);
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = e.message!;

        Helper.showToast(msg: errorMessage);
      } catch (e) {
        Helper.showToast(msg: "An unexpected error occurred: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }


  Future<void> signInWithEmail() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        User? user = await AuthService.signInWithEmail(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        if (user != null) {
          _storage.write('isLoggedIn', true);
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          Helper.showToast(msg: "Sign in failed. Please try again.");
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = e.message!;

        Helper.showToast(msg: errorMessage);
      } catch (e) {
        Helper.showToast(msg: "An unexpected error occurred: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }


  Future<void> signOut() async {
      isLoading.value = true;
    try {
      await AuthService.signOut();
      _storage.remove('isLoggedIn');
      Get.offAllNamed(AppRoutes.authScreen);
    } catch (e) {
      Helper.showToast(msg: "Sign out failed: $e");
    } finally {
      isLoading.value = false;
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
