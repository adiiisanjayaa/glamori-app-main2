import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/modules/rootPage/controllers/root_page_controller.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: GetBuilder<RootPageController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.getProfile(controller.id);
              },
              child: Column(
                children: [
                  const HomeHeader().marginOnly(top: 80),
                  const HomeMemberPoint().marginAll(20),
                  const HomeBanner(),
                  // const HomeCategory(),
                  const HomeBestSeller().marginOnly(top: 40),
                  const ProdukTerlarisHome(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Article',
                        style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                      ).marginOnly(left: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: ListView.builder(
                          padding: EdgeInsets.zero, // Set padding to zero to remove default padding
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.articlePage);
                              },
                              child: SizedBox(
                                width: double.infinity,
                                height: 73,
                                child: Card(
                                  color: AppColors.white,
                                  elevation: 0.4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.white,
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: SizedBox(
                                                width: 52,
                                                height: 52,
                                                child: ExtendedImage.asset(
                                                  Assets.article,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '7 Kunci Penting untuk menjaga kesehatan kulit',
                                              style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).marginSymmetric(horizontal: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProdukTerlarisHome extends StatelessWidget {
  const ProdukTerlarisHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Produk Terlaris',
                style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Lihat Detail ',
                    style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15,
                  )
                ],
              ),
            ],
          ).marginSymmetric(horizontal: 20),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 250,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 160,
                  child: Card(
                    color: AppColors.yellowSoft,
                    elevation: 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.yellowSoft,
                      ),
                      child: Column(
                        children: [
                          ExtendedImage.asset(
                            Assets.product,
                            width: 110,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            'Body toner',
                            style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold, colorText: AppColors.primary),
                          ),
                          Text(
                            'Rp 270.000',
                            style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class HomeBestSeller extends StatelessWidget {
  const HomeBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Seller Treatment',
                style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Row(
                children: [
                  Text(
                    'Lihat Detail ',
                    style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15,
                  )
                ],
              ),
            ],
          ).marginSymmetric(horizontal: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 160,
                    child: Card(
                      color: AppColors.yellowSoft,
                      elevation: 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.yellowSoft,
                        ),
                        child: Column(
                          children: [
                            ExtendedImage.asset(
                              Assets.product,
                              width: 110,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              'Body toner',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold, colorText: AppColors.primary),
                            ),
                            Text(
                              'Rp 270.000',
                              style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Kategori Produk',
              style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
            ).marginOnly(left: 20).marginOnly(top: 20),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 115,
                  child: Card(
                    color: AppColors.white,
                    elevation: 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icPerawatanWajah,
                              width: 40,
                            ).marginOnly(top: 5),
                            Text(
                              'Perawatan wajah',
                              textAlign: TextAlign.center,
                              style: AppStyle.styleTextBody14(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(
      init: RootPageController(),
      builder: (controller) {
        return Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                viewportFraction: 1.0,
                onPageChanged: controller.onPageChanged,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
              ),
              items: controller.imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.promotionPage);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/image.png"),
                            //todo active this when get image from api
                            // NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).marginSymmetric(horizontal: 5),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.imageUrls.map((url) {
                  int index = controller.imageUrls.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 3.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: controller.currentIndex == index ? AppColors.textBlack : AppColors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HomeMemberPoint extends StatelessWidget {
  const HomeMemberPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Membership Points',
              style: AppStyle.styleTextBody14(),
            ).marginOnly(top: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '58',
                      style: AppStyle.styleTextBody32(fontWeight: FontWeight.w600),
                    ).marginOnly(right: 10),
                    const Icon(
                      Icons.favorite,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  // width: double.infinity,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                height: 630,
                                decoration: const BoxDecoration(
                                  color: AppColors.bgBottomSheet,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icBottomSheet,
                                      width: 40,
                                    ).marginSymmetric(vertical: 10),
                                    Text(
                                      'Detail',
                                      style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 470,
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
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '1. Poin atau Hadiah:',
                                                    style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                                  ).marginSymmetric(vertical: 10),
                                                  Text(
                                                    'Setiap pembelian minimal 100k akan mendapatkan 10 point.Mendapatkan 5 point setiap refer a friend, kode referral di generateSetiap treatment mendapatkan 10 poin.',
                                                    style: AppStyle.styleTextBody14(),
                                                  ),
                                                  Text(
                                                    '2. Peraturan poin:',
                                                    style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                                  ).marginSymmetric(vertical: 10),
                                                  Text(
                                                    'Batas pengumpulan poin selama 2/3 bulan. Setiap 2/3 bulan akan di ulang poin nya/ di mulai dari awal. Poin akan di kasih/muncul di akun customer dalam 1x24 jam. Admin yang menentukan diskon ini utk produk apa saja, bukan tiket diskon bisa dipakai utk produk apa saja.',
                                                    style: AppStyle.styleTextBody14(),
                                                  ),
                                                  Text(
                                                    '3. Peraturan penggunaan poin:',
                                                    style: AppStyle.styleTextBody14(fontWeight: FontWeight.bold),
                                                  ).marginSymmetric(vertical: 10),
                                                  Text(
                                                    'Batas pengumpulan poin selama 2/3 bulan. Setiap 2/3 bulan akan di ulang poin nya/ di mulai dari awal. Poin akan di kasih/muncul di akun customer dalam 1x24 jam. Admin yang menentukan diskon ini utk produk apa saja, bukan tiket diskon bisa dipakai utk produk apa saja.',
                                                    style: AppStyle.styleTextBody14(),
                                                  ),
                                                ],
                                              ).marginAll(20),
                                            ),
                                          ).marginAll(20),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: AppStyle.styleButton(borderRadius: 23, width: 800),
                                            child: Text(
                                              'Keluar',
                                              style: AppStyle.styleTextBody16(colorText: AppColors.white),
                                            ),
                                          ).marginSymmetric(horizontal: 20),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primary,
                              ),
                              child: Center(
                                child: Text(
                                  'Detail',
                                  style: AppStyle.styleTextBody13(colorText: AppColors.grey),
                                ),
                              ),
                            ).marginOnly(right: 13, left: 10),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.redeemPage);
                              },
                              child: Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.primary, width: 1),
                                  color: AppColors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Redeem',
                                      style: AppStyle.styleTextBody13(colorText: AppColors.primary),
                                    ),
                                    const Icon(
                                      Icons.favorite,
                                      color: AppColors.primary,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).marginOnly(right: 15),
                      ),
                    ],
                  ),
                )
              ],
            ).marginAll(5),
          ],
        ).marginOnly(left: 10));
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return Center(
        child: Column(
          children: [
            Text(
              controller.isLogin == true ? 'Hello ${controller.users?.data?.fullname ?? ''},' : 'Hello Beauty,',
              style: AppStyle.styleTextBody30(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              'Lets take care of your skin!',
              style: AppStyle.styleTextBody16(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
