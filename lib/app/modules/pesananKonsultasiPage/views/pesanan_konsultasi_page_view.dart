import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

import '../controllers/pesanan_konsultasi_page_controller.dart';

class PesananKonsultasiPageView extends GetView<PesananKonsultasiPageController> {
  const PesananKonsultasiPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        centerTitle: true,
        title: Text(
          'Pesanan Konsultasi Saya',
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                spreadRadius: 0.3,
                blurRadius: 0.7,
                offset: Offset(0, 0.4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.yellowSoft,
                ),
                child: Column(
                  children: [
                    ExtendedImage.asset(
                      Assets.pesananKonsultasi,
                      width: 260,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ).marginSymmetric(horizontal: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Paket Acne Series',
                      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ).marginOnly(bottom: 5),
                  ).marginSymmetric(vertical: 10),
                  Text(
                    'Waktu Pemakaian',
                    style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                  ).marginOnly(bottom: 5),
                  Column(
                    children: [
                      const CustomBulletTitle(
                        bulletColor: AppColors.textBlack,
                        text: 'Facial Foam :  2x Sehari',
                      ).marginOnly(top: 3),
                      const CustomBulletTitle(
                        bulletColor: AppColors.textBlack,
                        text: 'Toner             :  2x Sehari',
                      ).marginOnly(top: 3),
                      const CustomBulletTitle(
                        bulletColor: AppColors.textBlack,
                        text: 'Day Cream   :  1x Sehari (Pagi / Siang)',
                      ),
                    ],
                  ).marginOnly(left: 10),
                ],
              ).marginAll(20),
              Row(
                children: [
                  Text(
                    'Durasi  :',
                    style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    ' 6 Bulan',
                    style: AppStyle.styleTextBody14(),
                    textAlign: TextAlign.start,
                  ),
                ],
              ).marginSymmetric(horizontal: 20)
            ],
          ).marginSymmetric(vertical: 20),
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }
}

class CustomBulletTitle extends StatelessWidget {
  const CustomBulletTitle({
    Key? key,
    required this.bulletColor,
    required this.text,
  }) : super(key: key);

  final Color bulletColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: bulletColor,
        ).marginOnly(top: 7),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13, color: AppColors.textBlack), // You can customize the style here
          ),
        ),
      ],
    );
  }
}
