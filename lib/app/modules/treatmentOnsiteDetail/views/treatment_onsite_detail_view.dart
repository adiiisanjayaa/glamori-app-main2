import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glamori/core/themes/colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/treatment_onsite_detail_controller.dart';

class TreatmentOnsiteDetailView extends GetView<TreatmentOnsiteDetailController> {
  const TreatmentOnsiteDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          centerTitle: true,
          title: Text(
            'Treatment Detail',
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
          child: Column(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    Assets.icOnsite,
                    width: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Treatment >',
                        style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Buccal Fat',
                        style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'Rabu, 18 Oktober 2023',
                    style: AppStyle.styleTextBody20(fontWeight: FontWeight.bold, colorText: AppColors.yellow),
                  ).marginOnly(top: 15, bottom: 3),
                  Text(
                    '13.00 WIB - 15.00 WIB',
                    style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '120 Menit',
                    style: AppStyle.styleTextBody14(colorText: AppColors.yellow),
                  ),
                ],
              ).marginSymmetric(vertical: 20).marginOnly(bottom: 10),
              Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi',
                      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Jl. Diponegoro No.156, Enggal, Engal, Kota Bandar Lampung, Lampung 35118',
                      style: AppStyle.styleTextBody13(),
                    ),
                  ],
                ).marginAll(20),
              ).marginSymmetric(horizontal: 20).marginOnly(top: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 21,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.yellowSoft,
                      ),
                      child: Center(
                        child: Text(
                          'Memanggil',
                          style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                        ),
                      ),
                    ).marginOnly(top: 3),
                  ],
                ).marginSymmetric(vertical: 10, horizontal: 20),
              ).marginSymmetric(horizontal: 20, vertical: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.yellow, width: 1),
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ).marginSymmetric(horizontal: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pasien',
                                  style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Hilda Mutiara',
                                  style: AppStyle.styleTextBody12(),
                                ),
                                Text(
                                  'F202012',
                                  style: AppStyle.styleTextBody12(),
                                ),
                                Text(
                                  '20 Tahun',
                                  style: AppStyle.styleTextBody12(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ).marginSymmetric(vertical: 5),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.yellow, width: 1),
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ).marginSymmetric(horizontal: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dokter',
                                  style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Dr. Romantika',
                                  style: AppStyle.styleTextBody12(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Tim Dokter Kecantikan',
                                  style: AppStyle.styleTextBody12(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).marginSymmetric(vertical: 5),
                    ).marginOnly(top: 20)
                  ],
                ).marginSymmetric(vertical: 15, horizontal: 20),
              ).marginSymmetric(horizontal: 20),
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(Routes.PESANAN_KONSULTASI_PAGE);
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: AppColors.white,
              //       boxShadow: const [
              //         BoxShadow(
              //           color: AppColors.grey,
              //           spreadRadius: 0.3,
              //           blurRadius: 0.7,
              //           offset: Offset(0, 0.4),
              //         ),
              //       ],
              //     ),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SvgPicture.asset(
              //           Assets.icPerawatanWajah,
              //           width: 25,
              //           color: AppColors.yellow,
              //         ).marginOnly(right: 10),
              //         Expanded(
              //           child: Text(
              //             'Pesanan Konsultasi Saya',
              //             style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
              //           ),
              //         ),
              //         const Icon(
              //           Icons.arrow_forward_outlined,
              //           color: AppColors.yellow,
              //         )
              //       ],
              //     ).marginSymmetric(vertical: 15, horizontal: 20),
              //   ).marginSymmetric(horizontal: 20, vertical: 10),
              // ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.yellowSoft,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan',
                      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                    ),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Jangan memakai krim siang sebelum treatment',
                    ).marginOnly(top: 3),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Wajib memakai sunscreen',
                    ).marginOnly(top: 3),
                  ],
                ).marginSymmetric(vertical: 10, horizontal: 20),
              ).marginSymmetric(horizontal: 20, vertical: 15).marginOnly(bottom: 50),
            ],
          ),
        ));
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
        ).marginOnly(top: 5),
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
