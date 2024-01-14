import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/modules/rootPage/controllers/root_page_controller.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

class BelanjaWidget extends StatelessWidget {
  const BelanjaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SearchWidget(),
                    // const KategoriProdukBelanja(),
                    const SizedBox(height: 20),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 12 / 18,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: controller.allProudct?.data?.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String? productName = controller.allProudct?.data?[index].name;
                        int? productPrice = controller.allProudct?.data?[index].price;
                        String? productId = controller.allProudct?.data?[index].sId;
                        String? productImage = controller.allProudct?.data?[index].image;
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.detailBelanjaPage,
                              arguments: {
                                'productId': productId,
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.yellowSoft,
                            ),
                            child: Column(
                              children: [
                                productImage != null
                                    ? ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                        child: Image.network(
                                          productImage,
                                          width: 1750,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ).marginOnly(bottom: 10)
                                    : const SizedBox.shrink(),
                                Text(
                                  productName ?? "",
                                  textAlign: TextAlign.center,
                                  style: AppStyle.styleTextBody16(fontWeight: FontWeight.w600, colorText: AppColors.primary),
                                ).marginSymmetric(horizontal: 10),
                                Text(
                                  controller.formatPrice(productPrice ?? 0),
                                  style: AppStyle.styleTextBody14(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).paddingOnly(right: 10),
                    const SizedBox(height: 120),
                  ],
                ),
              )),
            ],
          ),
        ),
      );
    });
  }
}

class KategoriProdukBelanja extends StatelessWidget {
  const KategoriProdukBelanja({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootPageController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.belanjaItems.length,
          itemBuilder: (context, index) {
            var data = controller.belanjaItems[index];
            return GestureDetector(
              onTap: () {
                controller.setSelectedBelanjaItem(data);
              },
              child: SizedBox(
                width: 110,
                child: Card(
                  color: AppColors.white,
                  elevation: 0.4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.selectedBelanjaItem?.id == data.id ? AppColors.yellowSoft : AppColors.white,
                      border: Border.all(
                        width: 1,
                        color: controller.selectedBelanjaItem?.id == data.id ? AppColors.yellow : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: AppStyle.styleTextBody14(
                            colorText: controller.selectedBelanjaItem?.id == data.id ? AppColors.yellow : AppColors.textBlack,
                            fontWeight: controller.selectedBelanjaItem?.id == data.id ? FontWeight.w600 : FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                decoration: AppStyle.inputDecorationFloating(
                  "Search",
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 25,
                    color: AppColors.textGrey,
                  ),
                ),
              ).marginOnly(right: 0),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.keranjangPage);
              },
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                width: 35,
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 20),
      ],
    );
  }
}
