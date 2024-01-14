// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/modules/rootPage/controllers/root_page_controller.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/pengiriman_page_controller.dart';

class PengirimanPageView extends GetView<PengirimanPageController> {
  const PengirimanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'Pengiriman',
          textAlign: TextAlign.center,
          style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.icBack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AnimatedBottomBar(),
      body: GetBuilder<PengirimanPageController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.yellowLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: AppColors.yellow,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.grey,
                      spreadRadius: 0.3,
                      blurRadius: 0.7,
                      offset: Offset(0, 0.4),
                    ),
                  ],
                ),
                child: Text(
                  'Barang Yang Dibeli Dalam Aplikasi Hanya Bisa Diambil Di Klinik Glamori',
                  style: AppStyle.styleTextBody16(colorText: Colors.black),
                  textAlign: TextAlign.center,
                ).marginAll(15),
              ).marginAll(15),
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icProduct,
                        ),
                        Text(
                          'Produk',
                          style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
                        ).marginOnly(left: 5),
                      ],
                    ),
                    Container(
                      // width: double.infinity,
                      // height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.primary, width: 1),
                        color: AppColors.white,
                      ),
                      child: controller.product == null
                          ? const SizedBox.shrink()
                          : ListView.builder(
                              itemCount: controller.product?.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                var item = controller.product?[index];

                                return Row(
                                  children: [
                                    item?.data?.image != null
                                        ? Image.network(
                                            item?.data?.image ?? '',
                                            width: 70,
                                            fit: BoxFit.fill,
                                          ).marginSymmetric(vertical: 5, horizontal: 10)
                                        : const SizedBox.shrink(),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item?.data?.name ?? '',
                                            style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller.formatPriceNoRp(item?.data?.price?.toDouble() ?? 0),
                                            style: AppStyle.styleTextBody14(),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'x${item?.qty ?? 1}',
                                      style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                    ).marginOnly(right: 20),
                                  ],
                                ).marginSymmetric(vertical: 10);
                              },
                            ),
                    ).marginOnly(top: 20),
                    // ListView.builder(
                    //   itemCount: controller.product?.length,
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   itemBuilder: (context, index) {
                    //     var item = controller.product?[index];

                    //     return Container(
                    //       width: double.infinity,
                    //       height: 110,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(20),
                    //         border: Border.all(color: AppColors.primary, width: 1),
                    //         color: AppColors.white,
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           item?.data?.image != null
                    //               ? Image.network(
                    //                   item?.data?.image ?? '',
                    //                   width: 70,
                    //                   fit: BoxFit.fill,
                    //                 ).marginSymmetric(vertical: 5, horizontal: 10)
                    //               : const SizedBox.shrink(),
                    //           Expanded(
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text(
                    //                   item?.data?.name ?? '',
                    //                   style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                    //                 ),
                    //                 Text(
                    //                   controller.formatPriceNoRp(item?.data?.price?.toDouble() ?? 0),
                    //                   style: AppStyle.styleTextBody14(),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           Text(
                    //             'x${item?.qty ?? 1}',
                    //             style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                    //           ).marginOnly(right: 20),
                    //         ],
                    //       ),
                    //     ).marginOnly(top: 20);
                    //   },
                    // ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 80,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     border: Border.all(color: AppColors.primary, width: 1),
                    //     color: AppColors.white,
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       ExtendedImage.asset(
                    //         Assets.product,
                    //         width: 70,
                    //         fit: BoxFit.fill,
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               'Body Toner',
                    //               style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                    //             ),
                    //             Text(
                    //               'Rp 270.000',
                    //               style: AppStyle.styleTextBody14(),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Text(
                    //         'x1',
                    //         style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                    //       ).marginOnly(right: 20),
                    //     ],
                    //   ),
                    // ).marginSymmetric(vertical: 10),
                  ],
                ).marginAll(20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icRincian,
                        ),
                        Text(
                          'Rincian pembayaran',
                          style: AppStyle.styleTextBody16(fontWeight: FontWeight.w500),
                        ).marginOnly(left: 5),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal Produk',
                          style: AppStyle.styleTextBody14(),
                        ),
                        Text(
                          controller.formatPrice(controller.subTotal),
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                        )
                      ],
                    ).marginOnly(top: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PPN (%)',
                          style: AppStyle.styleTextBody14(),
                        ),
                        Text(
                          '10%',
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                        )
                      ],
                    ).marginSymmetric(vertical: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          controller.formatPrice(controller.totalPrice),
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                        )
                      ],
                    ),
                  ],
                ).marginAll(20),
              ).marginSymmetric(horizontal: 20, vertical: 20),
              const SizedBox(height: 120),
            ],
          ),
        );
      }),
    );
  }
}

class AnimatedBottomBar extends StatelessWidget {
  const AnimatedBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengirimanPageController>(builder: (controller) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 75,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0.3),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                // height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: AppStyle.styleTextBody14(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      controller.formatPrice(controller.totalPrice),
                      style: AppStyle.styleTextBody14(colorText: AppColors.yellow, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showAlertDialogMarketPlace(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Beli Sekarang',
                        style: AppStyle.styleTextBody16(colorText: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

showAlertDialogMarketPlace(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    title: Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Marketplace",
                  textAlign: TextAlign.center,
                  style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.textBlack,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ItemStore(
                title: "Shopee",
                icon: Assets.icShopee,
                link: 'https://shopee.co.id/glamori_clinic',
              ), // Reduce the left margin
              const ItemStore(
                title: "Tokopedia",
                icon: Assets.icTokped,
                link: 'https://www.tokopedia.com/glamori-clinic',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showAlertDialog(context);
                },
                child: const ItemStoreKlinik(
                  title: "Klinik Glamori",
                  icon: Assets.icKlinik,
                ),
              ),
            ],
          ).marginSymmetric(vertical: 10),
        ),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class ItemStore extends StatelessWidget {
  const ItemStore({
    Key? key,
    required this.title,
    required this.icon,
    required this.link,
  }) : super(key: key);

  final String title;
  final String icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(link)) {
            await launch(link);
          } else {
            // Handle error, e.g., show an alert
            log('Could not launch $link');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ExtendedImage.asset(
                icon,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: AppStyle.styleTextBody14(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemStoreKlinik extends StatelessWidget {
  const ItemStoreKlinik({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ExtendedImage.asset(
                icon,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: AppStyle.styleTextBody14(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    title: Text(
      "Barang di keranjang hanya dapat Di checkout melalui klinik glamori",
      textAlign: TextAlign.center,
      style: AppStyle.styleTextBody16(),
    ),
    content: Text(
      "Apakah Anda Yakin?",
      textAlign: TextAlign.center,
      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.primary, width: 1),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Tidak',
                      style: AppStyle.styleTextBody16(),
                    ),
                  ))).marginOnly(right: 20),
          GetBuilder<PengirimanPageController>(builder: (controller) {
            return ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                var id = await controller.postTransaction(context);
                // ignore: use_build_context_synchronously
                if (id != null) showAlertDialogBarcode(context, id);
              },
              style: AppStyle.styleButton(borderRadius: 18, width: 80, height: 10),
              child: Text(
                'Ya',
                style: AppStyle.styleTextBody16(colorText: AppColors.white),
              ),
            );
          })
        ],
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogBarcode(BuildContext context, String? id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
            margin: const EdgeInsets.all(45),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "QR Code",
                          textAlign: TextAlign.center,
                          style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.rootPage);
                          var getPage = Get.find<RootPageController>();
                          getPage.onItemTapped(3);
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.textBlack,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Untuk redeem reward silahkan scan QR Code ini",
                  style: AppStyle.styleTextBody16(),
                  textAlign: TextAlign.center,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      // height: 200,
                      child: QrImageView(
                        data: id ?? '',
                        version: QrVersions.auto,
                      ),
                    ),
                  ],
                ),
                Text(
                  id ?? '',
                  style: AppStyle.styleTextBody16(colorText: AppColors.textBlack),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
