import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/theme/colors_constant.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/app_text_field.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/extensions.dart';

import '../../data/utils/app_styles/app_text_styles.dart';
import '../../data/utils/widgets/common_buttons.dart';
import '../../view_model/auth_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(() => Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Analytica To-Do App",
                      style: AppTextStyle.boldTextStyle(
                          size: 25.sp, color: Colors.white),
                    ).paddingBottom(20.w),
                    Text(
                      authController.wantToSignUp.value ? "Sign up" : "Sign in",
                      style: AppTextStyle.boldTextStyle(
                          size: 20.sp, color: Colors.white),
                    ),
                    if(authController.wantToSignUp.value)
                    AppTextField(
                      controller: authController.fullNameController,
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        hintText: 'write full name here...',
                      ),
                    ),
                    AppTextField(
                      controller: authController.emailController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        hintText: 'write email here...',
                      ),
                    ),
                    AppTextField(
                      controller: authController.passController,
                      textFieldType: TextFieldType.PASSWORD,
                      isPasswordVisible: authController.isPasswordVisible.value,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        suffixIcon: IconButton(
                            onPressed: authController.togglePasswordVisibility,
                            icon: Icon(authController.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility)),
                        hintText: 'write password here...',
                      ),
                    ),
                    CommonFlatButton(
                      title: authController.wantToSignUp.value ? "Sign up" : "Sign in",
                      btnColor: Get.isDarkMode
                          ? AppColors.foregroundColorPrimaryDark
                          : AppColors.elevatedBTNColorDark,
                      onTap: () {
                        if(authController.wantToSignUp.value) {
                          authController.signUp();
                        }
                        else {
                          authController.signIn();
                        }
                      },
                    ).withWidth(double.infinity),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              authController.wantToSignUp.value
                                  ? 'Already have account?'
                                  : "You don't have an account?",
                              style: AppTextStyle.primaryTextStyle(
                                  size: 13.sp,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          ),
                        ),
                        CommonTextButton(
                          title: authController.wantToSignUp.value
                              ? 'Sign In'
                              : 'Sign Up',
                          hPadding: 5,
                          vPadding: 5,
                          onTap: authController.toggleSignUpMode,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20.w),
                  ],
                ).marginSymmetric(vertical: 40.h, horizontal: 20.w),
              ).marginSymmetric(vertical: 20.w, horizontal: 15.w)),
        ),
      ),
    );
  }
}
