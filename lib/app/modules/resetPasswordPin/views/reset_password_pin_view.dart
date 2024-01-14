import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import '../controllers/reset_password_pin_controller.dart';

class ResetPasswordPinView extends GetView<ResetPasswordPinController> {
  const ResetPasswordPinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Reset Password',
            textAlign: TextAlign.center,
            style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              Assets.icBack,
            ),
            onPressed: () {
              Get.toNamed(Routes.resetPasswordPage);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icPassEmail,
                width: 300,
                height: 300,
              ),
              Text(
                'Silakan masukkan 4 digit kode yang dikirimkan ke email Anda',
                style: AppStyle.styleTextBody14(),
                textAlign: TextAlign.center,
              ).marginSymmetric(horizontal: 15),
              PinCodeFields(
                length: 4,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 60.0,
                fieldWidth: 60.0,
                borderWidth: 1.0,
                activeBorderColor: AppColors.primary,
                activeBackgroundColor: AppColors.yellowSoft,
                borderRadius: BorderRadius.circular(10.0),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                fieldBackgroundColor: AppColors.inputColor,
                borderColor: AppColors.inputColor,
                textStyle: AppStyle.styleTextBody22(fontWeight: FontWeight.bold),
                onComplete: (output) {
                  // Your logic with pin code
                },
              ).marginSymmetric(horizontal: 20).marginSymmetric(vertical: 30),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.createPasswordPages);
                },
                style: AppStyle.styleButton(borderRadius: 23, width: 800),
                child: Text(
                  'Kirim',
                  style: AppStyle.styleTextBody16(colorText: AppColors.white),
                ),
              ).marginSymmetric(horizontal: 20)
            ],
          ),
        ));
  }
}
