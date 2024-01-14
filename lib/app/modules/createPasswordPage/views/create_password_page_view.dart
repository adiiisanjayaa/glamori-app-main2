import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

import '../controllers/create_password_page_controller.dart';

class CreatePasswordPageView extends GetView<CreatePasswordPageController> {
  const CreatePasswordPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create Reset Password',
            textAlign: TextAlign.center,
            style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              Assets.icBack,
            ),
            onPressed: () {
              Get.toNamed(Routes.resetPasswordPin);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icPassOtp,
              width: 300,
              height: 300,
            ),
            Text(
              'Tetapkan kata sandi baru Anda sehingga Anda dapat login dan mengakses Glamori',
              style: AppStyle.styleTextBody14(),
              textAlign: TextAlign.center,
            ).marginSymmetric(horizontal: 15),
            TextField(
              decoration: AppStyle.inputDecorationFloating("Kata sandi baru"),
              // controller: controller.usernameController,
            ).marginSymmetric(horizontal: 20).marginOnly(top: 30),
            TextField(
              decoration: AppStyle.inputDecorationFloating("Konfirmasi kata sandi"),
              // controller: controller.usernameController,
            ).marginSymmetric(horizontal: 20).marginOnly(top: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.resetPasswordPin);
              },
              style: AppStyle.styleButton(borderRadius: 23, width: 800),
              child: Text(
                'Kirim',
                style: AppStyle.styleTextBody16(colorText: AppColors.white),
              ),
            ).marginSymmetric(horizontal: 20).marginOnly(top: 20)
          ],
        ));
  }
}
