import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/redeem_page_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RedeemPageView extends GetView<RedeemPageController> {
  const RedeemPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Obx(() => Text(
                controller.isRedeemed.value ? 'Redeemed Voucher' : 'Redeem',
                textAlign: TextAlign.center,
                style: AppStyle.styleTextBody18(fontWeight: FontWeight.bold),
              )),
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
                labelStyle: AppStyle.styleTextBody18(),
                unselectedLabelColor: AppColors.inactiveIconColor,
                unselectedLabelStyle: AppStyle.styleTextBody18(colorText: AppColors.inactiveIconColor),
                tabs: const [
                  Tab(
                    child: Text('Redeem'),
                  ),
                  Tab(
                    child: Text('Redeemed'),
                  ),
                ],
                onTap: (index) {
                  if (index == 1) {
                    // Tab "Redeemed" is clicked
                    controller.isRedeemed.value = true;
                  } else {
                    // Tab "Redeem" is clicked
                    controller.isRedeemed.value = false;
                  }
                },
              ),
              const Expanded(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    RedeemItem(),
                    RedeemedItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RedeemItem extends StatelessWidget {
  const RedeemItem({
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
                            Text(
                              'Diskon 10%',
                              style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Jangan lewatkan kesempatan istimewa ini! Dapatkan diskon 15% untuk setiap pembelian produk Glamori.  Beli produk kami sekarang!',
                              style: AppStyle.styleTextBody14(),
                            ),
                            GestureDetector(
                              onTap: () {
                                showAlertDialog(context);
                              },
                              child: Container(
                                height: 35,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Gunakan 50',
                                      style: AppStyle.styleTextBody14(colorText: AppColors.grey),
                                    ),
                                    const Icon(
                                      Icons.favorite,
                                      color: AppColors.white,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ).marginSymmetric(vertical: 10),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.detailRedeemPage);
                                },
                                child: Container(
                                    height: 35,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: AppColors.primary, width: 1),
                                      color: AppColors.white,
                                    ),
                                    child: Text(
                                      'Detail',
                                      textAlign: TextAlign.center,
                                      style: AppStyle.styleTextBody14(colorText: AppColors.primary),
                                    ).marginOnly(top: 5))),
                          ],
                        ).marginAll(20))
                    .marginAll(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RedeemedItem extends StatelessWidget {
  const RedeemedItem({
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
                      Text(
                        'Diskon 10%',
                        style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Jangan lewatkan kesempatan istimewa ini! Dapatkan diskon 15% untuk setiap pembelian produk Glamori.  Beli produk kami sekarang!',
                        style: AppStyle.styleTextBody14(),
                      ),
                      GestureDetector(
                        onTap: () {
                          showAlertDialogBarcode(context);
                        },
                        child: Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Text(
                              'Show Barcode',
                              style: AppStyle.styleTextBody14(colorText: AppColors.grey),
                            ),
                          ),
                        ).paddingSymmetric(vertical: 10),
                      ),
                    ],
                  ).paddingAll(20),
                ).marginAll(5);
              },
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
    content: Text(
      "Yakin Ingin Menukarkan Poin Anda dengan Reward Ini?",
      textAlign: TextAlign.center,
      style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: 40,
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
                      ))).marginOnly(right: 5)),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: AppStyle.styleButton(borderRadius: 18),
              child: Text(
                'Ya',
                style: AppStyle.styleTextBody16(colorText: AppColors.white),
              ),
            ),
          )
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

showAlertDialogBarcode(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    title: Column(
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
              width: 300,
              height: 250,
              child: QrImageView(
                data: '1234567890',
                version: QrVersions.auto,
                size: 300.0,
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
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
