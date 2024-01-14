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

class TransaksiWidget extends StatelessWidget {
  const TransaksiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondary,
            centerTitle: true,
            title: Text(
              'Pesanan',
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
          backgroundColor: AppColors.secondary,
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  labelStyle: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
                  unselectedLabelColor: AppColors.inactiveIconColor,
                  unselectedLabelStyle: AppStyle.styleTextBody18(colorText: AppColors.inactiveIconColor),
                  tabs: const [
                    Tab(
                      child: Text('Belum Dibayar'),
                    ),
                    Tab(
                      child: Text('Sudah Dibeli'),
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(physics: BouncingScrollPhysics(), children: <Widget>[
                    BelumDibayarItem(),
                    SudahDibeliItem(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class BelumDibayarItem extends StatelessWidget {
  const BelumDibayarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              primary: false,
              itemBuilder: (context, index) {
                return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.grey,
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset: Offset(0, 0.2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ExtendedImage.asset(
                                  Assets.product,
                                  width: 80,
                                  fit: BoxFit.fill,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Body Toner',
                                        style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                      ),
                                      Text(
                                        'x1',
                                        style: AppStyle.styleTextBody14(),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showAlertDialog(context);
                                        },
                                        child: Text(
                                          'Lihat 3 Produk lainnya',
                                          style: AppStyle.styleTextBody10(colorText: AppColors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Rp 270.000',
                                  style: AppStyle.styleTextBody16(colorText: AppColors.yellow, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.yellowSoft,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Pesanan',
                                    style: AppStyle.styleTextBody13(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp 270.000',
                                    style: AppStyle.styleTextBody13(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                                  ),
                                ],
                              ).marginSymmetric(horizontal: 10),
                            ).marginSymmetric(vertical: 5).marginOnly(left: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showAlertDialogBarcode(context);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primary,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bayar',
                                          style: AppStyle.styleTextBody14(colorText: AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).marginOnly(top: 10),
                          ],
                        ).marginOnly(top: 20, right: 20, bottom: 20))
                    .marginAll(5);
              },
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

class SudahDibeliItem extends StatelessWidget {
  const SudahDibeliItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              primary: false,
              itemBuilder: (context, index) {
                return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.grey,
                              spreadRadius: 0.2,
                              blurRadius: 0.5,
                              offset: Offset(0, 0.2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: ExtendedImage.asset(
                                    Assets.product,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Body Toner',
                                        style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                      ),
                                      Text(
                                        'x1',
                                        style: AppStyle.styleTextBody14(),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showAlertDialog(context);
                                        },
                                        child: Text(
                                          'Lihat 3 Produk lainnya',
                                          style: AppStyle.styleTextBody10(colorText: AppColors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Rp 270.000',
                                  style: AppStyle.styleTextBody16(colorText: AppColors.yellow, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.yellowSoft,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Pesanan',
                                    style: AppStyle.styleTextBody13(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp 270.000',
                                    style: AppStyle.styleTextBody13(fontWeight: FontWeight.w600, colorText: AppColors.yellow),
                                  ),
                                ],
                              ).marginSymmetric(horizontal: 10),
                            ).marginSymmetric(vertical: 5).marginOnly(left: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.detailBelanjaPage,
                                      arguments: {
                                        'productId': '6560cd4cae1cb9b2c171f316',
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: AppColors.primary, width: 1),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Beli Lagi',
                                          style: AppStyle.styleTextBody14(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).marginOnly(top: 10),
                          ],
                        ).marginOnly(top: 20, right: 20, bottom: 20))
                    .marginAll(5);
              },
            ),
            const SizedBox(height: 120),
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
      content: SizedBox(
        height: 340,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "List Produk",
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
              height: 300,
              width: 400,
              child: ListView.builder(
                itemCount: 3, // Replace with the actual item count
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primary, width: 1),
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        ExtendedImage.asset(
                          Assets.product,
                          width: 70,
                          fit: BoxFit.fill,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Body Toner',
                                style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rp 270.000',
                                style: AppStyle.styleTextBody14(),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'x1',
                          style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                        ).marginOnly(right: 20),
                      ],
                    ),
                  ).marginOnly(top: 10);
                },
              ),
            ),
          ],
        ),
      ));

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogBarcode(BuildContext context) {
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
                        data: '1234567890',
                        version: QrVersions.auto,
                      ),
                    ),
                  ],
                ),
                Text(
                  "GT202312000001",
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
