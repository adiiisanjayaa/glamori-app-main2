import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/modules/treatmentDetail/controllers/treatment_detail_controller.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

class TreatmentDetailView extends GetView<TreatmentDetailController> {
  const TreatmentDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TreatmentDetailController>(
        init: TreatmentDetailController(),
        builder: (controller) {
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
                    Get.back();
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          controller.detail?.isVirtual == true ? Assets.icVideo : Assets.icOnsite,
                          width: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Treatment > ${controller.detail?.transaction?.items?.isNotEmpty == true ? controller.detail?.transaction?.items?.first.name ?? '' : ''}',
                              style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Text(
                          controller.dateFormat(),
                          style: AppStyle.styleTextBody20(fontWeight: FontWeight.bold, colorText: controller.colorPrimary),
                        ).marginOnly(top: 15, bottom: 3),
                        Text(
                          controller.timeFormat(),
                          style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '0 Menit',
                          style: AppStyle.styleTextBody14(colorText: controller.colorPrimary),
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
                            controller.detail?.branch ?? '',
                            style: AppStyle.styleTextBody13(),
                          ),
                        ],
                      ).marginAll(20),
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
                          Text(
                            'Status',
                            style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 21,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: controller.colorSecondary,
                            ),
                            child: Center(
                              child: Text(
                                controller.detail?.status ?? '',
                                style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600, colorText: controller.colorPrimary),
                              ),
                            ),
                          ).marginOnly(top: 3),
                        ],
                      ).marginSymmetric(vertical: 10, horizontal: 20),
                    ).marginSymmetric(horizontal: 20),
                    controller.detail?.isVirtual == true
                        ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
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
                                  'Meeting',
                                  style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    log(controller.detail?.virtualUrl ?? '');
                                  },
                                  child: Text(
                                    ' Klik disini',
                                    style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600, colorText: controller.colorPrimary),
                                  ),
                                ),
                              ],
                            ).marginSymmetric(vertical: 10, horizontal: 20),
                          ).marginSymmetric(horizontal: 20, vertical: 15)
                        : const SizedBox.shrink(),
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
                              border: Border.all(color: controller.colorPrimary, width: 1),
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
                                        controller.detail?.patient?.fullname ?? '',
                                        style: AppStyle.styleTextBody12(),
                                      ),
                                      Text(
                                        controller.detail?.patient?.sId ?? '',
                                        style: AppStyle.styleTextBody12(),
                                      ),
                                      Text(
                                        '0 Tahun',
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
                              border: Border.all(color: controller.colorPrimary, width: 1),
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
                                        controller.detail?.doctor?.fullname ?? '',
                                        style: AppStyle.styleTextBody12(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '-',
                                        style: AppStyle.styleTextBody12(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).marginSymmetric(vertical: 5),
                          ).marginOnly(top: 20)
                        ],
                      ).marginSymmetric(vertical: 10, horizontal: 20),
                    ).marginSymmetric(horizontal: 20).marginOnly(top: 15),
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
                    //           color: controller.color,
                    //         ).marginOnly(right: 10),
                    //         Expanded(
                    //           child: Text(
                    //             'Pesanan Konsultasi Saya',
                    //             style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                    //           ),
                    //         ),
                    //         Icon(
                    //           Icons.arrow_forward_outlined,
                    //           color: controller.color,
                    //         )
                    //       ],
                    //     ).marginSymmetric(vertical: 10, horizontal: 20),
                    //   ).marginSymmetric(horizontal: 20, vertical: 15),
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
                          CustomBulletTitle(
                            bulletColor: AppColors.textBlack,
                            text: controller.detail?.notes ?? '-',
                          ).marginOnly(top: 3),
                          // const CustomBulletTitle(
                          //   bulletColor: AppColors.textBlack,
                          //   text: 'Wajib memakai sunscreen',
                          // ).marginOnly(top: 3),
                        ],
                      ).marginSymmetric(vertical: 10, horizontal: 20),
                    ).marginSymmetric(horizontal: 20, vertical: 10).marginOnly(bottom: 50, top: 10),
                  ],
                ),
              ));
        });
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
