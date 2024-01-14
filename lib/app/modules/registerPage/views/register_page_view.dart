// ignore_for_file: deprecated_member_use

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/register_page_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  const RegisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: GetBuilder<RegisterPageController>(builder: (controller) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: ExtendedImage.asset(
                  Assets.background,
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExtendedImage.asset(
                        Assets.logo,
                        width: 174,
                        fit: BoxFit.fill,
                      ).marginOnly(top: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25),
                          TextField(
                            decoration: AppStyle.inputDecorationFloating("Nama Lengkap"),
                            controller: controller.nameController,
                          ).marginSymmetric(horizontal: 20),
                          Text(
                            'Email',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          TextField(
                            decoration: AppStyle.inputDecorationFloating("Email"),
                            controller: controller.emailController,
                          ).marginSymmetric(horizontal: 20),
                          Text(
                            'No Telepon',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          TextField(
                            decoration: AppStyle.inputDecorationFloating("No Telepon"),
                            controller: controller.phoneController,
                          ).marginSymmetric(horizontal: 20),
                          Text(
                            'Jenis Kelamin',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(color: AppColors.inputColor, borderRadius: BorderRadius.circular(15)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: const Text(
                                  'Jenis Kelamin',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.yellow,
                                  ),
                                  iconSize: 14,
                                  iconEnabledColor: Colors.yellow,
                                  iconDisabledColor: Colors.grey,
                                ),
                                items: controller.items
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
                                value: controller.selectedItem,
                                onChanged: (String? value) {
                                  controller.setKelamin(value);
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
                          ).marginSymmetric(horizontal: 20),
                          // Container(
                          //     width: double.infinity,
                          //     height: 45,
                          //     decoration: BoxDecoration(color: AppColors.inputColor, borderRadius: BorderRadius.circular(15)),
                          //     child: DropdownButtonFormField(
                          //       value: controller.selectedItem,
                          //       isExpanded: true,
                          //       alignment: Alignment.bottomCenter,
                          //       decoration: InputDecoration(
                          //         contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          //         border: InputBorder.none,
                          //         hintStyle: AppStyle.styleTextBody16(colorText: AppColors.textLightGrey), // Set the hint color here
                          //       ),
                          //       style: AppStyle.styleTextBody16(colorText: Colors.black),
                          //       icon: const Icon(
                          //         Icons.keyboard_arrow_down_outlined,
                          //         color: AppColors.textLightGrey,
                          //       ),
                          //       items: controller.items.map((String value) {
                          //         return DropdownMenuItem(
                          //           value: value,
                          //           child: Text(
                          //             value,
                          //             style: AppStyle.styleTextBody16(colorText: Colors.black),
                          //           ),
                          //         );
                          //       }).toList(),
                          //       onChanged: (String? newValue) {
                          //         controller.selectedItem = newValue!;
                          //       },
                          //       hint: Text(
                          //         'Choose an option', // Set your hint text here
                          //         style: AppStyle.styleTextBody16(colorText: AppColors.textLightGrey),
                          //       ),
                          //     )).marginSymmetric(horizontal: 20),
                          Text(
                            'Tanggal Lahir',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          TextField(
                            decoration: AppStyle.inputDecorationFloating(
                              "Tanggal Lahir",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.selectDate(context);
                                  },
                                  child: SvgPicture.asset(
                                    Assets.icDate,
                                    color: AppColors.yellow,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller.dateController,
                            readOnly: true,
                          ).marginSymmetric(horizontal: 20),
                          Text(
                            'Kata Sandi',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          TextFormField(
                            decoration: AppStyle.inputDecorationFloating(
                              "Ketik disini",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.passwordVisibility();
                                },
                                child: controller.passwordVisible
                                    ? Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          Assets.icInvisiblePass,
                                          color: AppColors.yellow,
                                          width: 20,
                                          height: 20,
                                        ))
                                    : Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          color: AppColors.yellow,
                                          Assets.icVisiblePass,
                                        ),
                                      ),
                              ),
                            ),
                            validator: (val) {
                              if (val?.isEmpty == true) return 'Mohon isi password';
                              return null;
                            },
                            controller: controller.passwordController,
                            obscureText: controller.passwordVisible,
                          ).marginSymmetric(horizontal: 20),
                          Text(
                            'Konfirmasi Kata Sandi',
                            style: AppStyle.styleTextBody14(),
                          ).marginOnly(left: 25).marginOnly(top: 20),
                          TextFormField(
                            decoration: AppStyle.inputDecorationFloating(
                              "Ketik disini",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.passwordKonfirmasiVisibility();
                                },
                                child: controller.passwordKonfirmasiVisible
                                    ? Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          Assets.icInvisiblePass,
                                          color: AppColors.yellow,
                                          width: 20,
                                          height: 20,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          Assets.icVisiblePass,
                                          color: AppColors.yellow,
                                        ),
                                      ),
                              ),
                            ),
                            validator: (val) {
                              if (val?.isEmpty == true) return 'Mohon isi konfirmasi password';
                              if (val != controller.passwordController.text) return 'Konfirmasi password salah';
                              return null;
                            },
                            controller: controller.passwordKonfirmasiController,
                            obscureText: controller.passwordKonfirmasiVisible,
                          ).marginSymmetric(horizontal: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Lupa Password?',
                                style: AppStyle.styleTextBody14(),
                              ),
                            ],
                          ).marginOnly(right: 25).marginSymmetric(vertical: 15),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                controller.register(context);
                              }
                            },
                            style: AppStyle.styleButton(borderRadius: 23, width: 800),
                            child: Text(
                              'Daftar',
                              style: AppStyle.styleTextBody16(colorText: AppColors.white),
                            ),
                          ).marginSymmetric(horizontal: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sudah punya akun? ',
                                style: AppStyle.styleTextBody14(),
                              ),
                              Text(
                                'Masuk',
                                style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ).marginOnly(top: 20)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
