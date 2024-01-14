import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

import '../controllers/reset_password_email_controller.dart';

class ResetPasswordEmailView extends GetView<ResetPasswordEmailController> {
  const ResetPasswordEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Reset Password',
            textAlign: TextAlign.center,
            style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              Assets.icBack,
            ),
            onPressed: () {
              Get.toNamed(Routes.rootPage);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icPassEmail,
              width: 300,
              height: 300,
            ),
            Text(
              'Silakan masukkan email anda untuk menerima nomor verifikasi',
              style: AppStyle.styleTextBody14(),
              textAlign: TextAlign.center,
            ).marginSymmetric(horizontal: 15),
            TextField(
              decoration: AppStyle.inputDecorationFloating("Email"),
              // controller: controller.usernameController,
            ).marginSymmetric(horizontal: 20).marginSymmetric(vertical: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.resetPasswordPin);
              },
              style: AppStyle.styleButton(borderRadius: 23, width: 800),
              child: Text(
                'Kirim',
                style: AppStyle.styleTextBody16(colorText: AppColors.white),
              ),
            ).marginSymmetric(horizontal: 20)
          ],
        ));
  }
}
