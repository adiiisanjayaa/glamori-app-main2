import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/article_page_controller.dart';

class ArticlePageView extends GetView<ArticlePageController> {
  const ArticlePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'Article',
          textAlign: TextAlign.center,
          style: AppStyle.styleTextBody18(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            icon: SvgPicture.asset(
              Assets.icBack,
            ),
            onPressed: () {
              Get.toNamed(Routes.rootPage);
            }),
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
                    '7 Kunci Penting Menjaga Kesehatan Kulit',
                    style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                  ),
                  ExtendedImage.asset(
                    Assets.article,
                    width: 400,
                    fit: BoxFit.fill,
                  ).marginSymmetric(vertical: 15),
                  Text(
                    'Kulit adalah organ terbesar dalam tubuh kita, dan menjaga kesehatan kulit adalah langkah penting dalam menjaga kesehatan secara keseluruhan. Di bawah ini, kita akan membahas tujuh kunci penting untuk menjaga kesehatan kulit Anda.1. Rutin Membersihkan Kulit Pembersih wajah yang lembut membantu menghilangkan kotoran, minyak, dan sel-sel kulit mati yang dapat menyumbat pori-pori dan menyebabkan jerawat.',
                    style: AppStyle.styleTextBody14(),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ).marginAll(20),
            ).marginAll(20),
          ),
        ],
      ),
    );
  }
}
