import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/modules/rootPage/controllers/root_page_controller.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/treatment_pages_controller.dart';

class TreatmentPagesView extends GetView<TreatmentPagesController> {
  const TreatmentPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.secondary,
          centerTitle: true,
          title: Text(
            'Treatment',
            textAlign: TextAlign.center,
            style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.separated(
                        itemCount: controller.dateAppoinment.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        shrinkWrap: true,
                        primary: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.setCurrentData(index);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 55,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: controller.currentData == index ? AppColors.yellowSoft : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.grey,
                                        spreadRadius: 0.2,
                                        blurRadius: 1,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.dateAppoinment[index],
                                        textAlign: TextAlign.center,
                                        style: AppStyle.styleTextBody30(
                                          fontWeight: FontWeight.bold,
                                          colorText: controller.currentData == index ? AppColors.yellow : AppColors.textBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '3 Hari Lagi',
                                  textAlign: TextAlign.center,
                                  style: AppStyle.styleTextBody10(
                                    fontWeight: FontWeight.bold,
                                    colorText: controller.currentData == index ? AppColors.yellow : AppColors.textBlack,
                                  ),
                                ).marginOnly(top: 10),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icRiwayat,
                                    color: AppColors.textBlack,
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Riwayat',
                              textAlign: TextAlign.center,
                              style: AppStyle.styleTextBody10(
                                fontWeight: FontWeight.bold,
                              ),
                            ).marginOnly(top: 10),
                          ],
                        ),
                      ).marginOnly(left: 10),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: AppColors.inputColor)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Text(
                            'Semua',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textBlack,
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.textBlack,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.yellow,
                            iconDisabledColor: Colors.grey,
                          ),
                          items: controller.itemsTreatment
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: controller.selectedItemTreatment,
                          onChanged: (String? value) {
                            controller.setTreatment(value);
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: double.infinity,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: TextField(
                      decoration: AppStyle.inputDecorationFloatingTreatment(
                        "Tanggal ",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              controller.selectDateTreatment(context);
                            },
                            child: SvgPicture.asset(
                              Assets.icDate,
                              color: AppColors.textBlack,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                      controller: controller.dateTreatmentController,
                      readOnly: true,
                    ),
                  ).marginOnly(left: 20)
                ],
              ).marginSymmetric(horizontal: 20),
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.treatmentOnsitePage);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.yellowSoft,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Assets.icOnsite,
                              width: 90,
                            ),
                          ],
                        ).marginAll(10),
                      ).marginSymmetric(horizontal: 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Rabu, 18 Oktober 2023',
                                style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                                textAlign: TextAlign.start,
                              ).marginSymmetric(vertical: 5),
                            ),
                            Container(
                                height: 21,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.yellowSoft,
                                ),
                                child: Center(
                                  child: Text(
                                    'Selesai',
                                    style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                                  ),
                                )),
                          ],
                        ).marginSymmetric(vertical: 5),
                        Text(
                          '13.00 WIB',
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                        ).marginOnly(bottom: 5),
                        Container(
                            height: 21,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.yellowSoft,
                            ),
                            child: Text(
                              'On-Site Appointment',
                              textAlign: TextAlign.center,
                              style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600),
                            )),
                        Row(
                          children: [
                            const Icon(Icons.person, color: AppColors.yellow, size: 17),
                            Text(
                              'Hilda Mutiara',
                              style: AppStyle.styleTextBody12(),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              '- F202012',
                              style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ).marginSymmetric(vertical: 5),
                        Row(
                          children: [
                            const Icon(Icons.person, color: AppColors.yellow, size: 17),
                            Text(
                              'Dr. Romantika',
                              style: AppStyle.styleTextBody12(),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )
                      ],
                    ).marginSymmetric(vertical: 10, horizontal: 25),
                  ],
                ).marginSymmetric(vertical: 20),
              ).marginSymmetric(horizontal: 20, vertical: 10),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.treatmentVirtualPage);
                },
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.blueSoft,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Assets.icVideo,
                              width: 90,
                            ),
                          ],
                        ).marginAll(10),
                      ).marginSymmetric(horizontal: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Rabu, 18 Oktober 2023',
                                  style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600, colorText: AppColors.blue),
                                  textAlign: TextAlign.start,
                                ).marginSymmetric(vertical: 5),
                              ),
                              Container(
                                  height: 21,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.blueSoft,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Selesai',
                                      style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600, colorText: AppColors.blue),
                                    ),
                                  )),
                            ],
                          ),
                          Text(
                            '13.00 WIB',
                            style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                          ).marginOnly(bottom: 5),
                          Container(
                              height: 21,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.blueSoft,
                              ),
                              child: Text(
                                'Virtual Appointment',
                                textAlign: TextAlign.center,
                                style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600),
                              )),
                          Row(
                            children: [
                              const Icon(Icons.person, color: AppColors.blue, size: 17),
                              Text(
                                'Hilda Mutiara',
                                style: AppStyle.styleTextBody12(),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                '- F202012',
                                style: AppStyle.styleTextBody12(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ).marginSymmetric(vertical: 5),
                          Row(
                            children: [
                              const Icon(Icons.person, color: AppColors.blue, size: 17),
                              Text(
                                'Dr. Romantika',
                                style: AppStyle.styleTextBody12(),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )
                        ],
                      ).marginSymmetric(vertical: 10, horizontal: 25),
                    ],
                  ).marginSymmetric(vertical: 20),
                ).marginSymmetric(horizontal: 20, vertical: 10),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      );
    });
  }
}
