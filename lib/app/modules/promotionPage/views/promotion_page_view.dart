import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

import '../controllers/promotion_page_controller.dart';

class PromotionPageView extends GetView<PromotionPageController> {
  const PromotionPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'Promosi',
          textAlign: TextAlign.center,
          style: AppStyle.styleTextBody18(fontWeight: FontWeight.w600),
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
        children: [
          IntrinsicHeight(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Luxury Cosmetics',
                    style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                  ),
                  ExtendedImage.asset(
                    Assets.promotionsImage,
                    width: 400,
                    fit: BoxFit.fill,
                  ).marginSymmetric(vertical: 15),
                  Text(
                    'Kosmetik mewah adalah wujud keindahan yang tak tertandingi dan kualitas yang tak tertandingi. Dari lipstik berwarna-warni yang memberikan hasil sempurna hingga produk perawatan kulit yang mengandung bahan-bahan langka, kosmetik mewah tidak hanya menawarkan kecantikan yang tak terbantahkan, tetapi juga pengalaman mewah dalam perawatan diri.',
                    style: AppStyle.styleTextBody14(),
                  ),
                ],
              ).marginAll(20),
            ).marginAll(20),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.primary, width: 1),
                  color: AppColors.white,
                ),
                child: Center(
                  child: Text(
                    'Dapatkan Promosinya!',
                    style: AppStyle.styleTextBody16(),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
