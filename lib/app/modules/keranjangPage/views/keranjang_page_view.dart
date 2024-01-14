import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';
import '../controllers/keranjang_page_controller.dart';

class KeranjangPageView extends GetView<KeranjangPageController> {
  const KeranjangPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KeranjangPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.secondary,
          title: Text(
            'Keranjang',
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
        body: ListView.builder(
          itemCount: controller.carts.length,
          primary: true,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = controller.carts[index];

            return CheckboxListTileWidget(
              checkboxValue: item.checked == 1,
              isThreeLine: false,
              onChanged: (bool? value) {
                controller.updateCheckboxValue(item.data?.sId ?? '', value == true ? 1 : 0);
              },
              title: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
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
                  child: Row(
                    children: [
                      ExtendedImage.network(
                        item.data?.image ?? '',
                        width: 80,
                        fit: BoxFit.fill,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ).marginOnly(right: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.data?.name ?? '-',
                              style: AppStyle.styleTextBody16(fontWeight: FontWeight.bold),
                              maxLines: 3,
                            ),
                            Text(
                              item.data?.description ?? '-',
                              style: AppStyle.styleTextBody16(),
                            ),
                            Text(
                              "Rp. ${item.data?.price.toString() ?? '0'}",
                              style: AppStyle.styleTextBody13(colorText: AppColors.yellow, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      QtyButton(
                        onMin: () {
                          print("onmin");
                          var itemQty = (item.qty ?? 0);
                          controller.updateQty(item.data?.sId ?? '', itemQty > 1 ? itemQty - 1 : 1);
                          // Update the corresponding qty controller
                          // int currentValue = int.tryParse(qtyController.text) ?? 0;
                          // int newValue = currentValue - 1;

                          // // Ensure the new value is at least 1
                          // if (newValue >= 1) {
                          //   qtyController.text = newValue.toString();
                          // }
                        },
                        onPlus: () {
                          print("onPlus");
                          var itemQty = (item.qty ?? 0);
                          controller.updateQty(item.data?.sId ?? '', itemQty >= 1 ? itemQty + 1 : 1);
                          // Update the corresponding qty controller
                          // qtyController.text = (int.tryParse(qtyController.text) ?? 0 + 1).toString();
                        },
                        qty: item.qty.toString(),
                      ),
                    ],
                  )),
            ).marginOnly(bottom: controller.carts.length - 1 == index ? 100 : 0);
          },
        ),
      );
    });
  }
}

class AnimatedBottomBar extends StatelessWidget {
  const AnimatedBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KeranjangPageController>(builder: (controller) {
      return controller.carts.isEmpty
          ? const SizedBox.shrink()
          : Align(
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
                      Row(
                        children: [
                          Checkbox(
                            fillColor: MaterialStatePropertyAll(controller.isAllChecked ? AppColors.yellow : AppColors.grey),
                            activeColor: AppColors.yellow,
                            value: controller.isAllChecked,
                            side: BorderSide.none,
                            onChanged: (bool? value) {
                              controller.checkListAll(value);
                            },
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(
                            'All',
                            style: AppStyle.styleTextBody16(),
                          ),
                        ],
                      ).marginOnly(right: 5),
                      GestureDetector(
                        onTap: () {
                          showAlertDialog(context);
                        },
                        child: Container(
                          width: 53,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: AppColors.primary, width: 1),
                            color: AppColors.white,
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                            Assets.icDelete,
                            width: 28,
                          )),
                        ),
                      ).marginSymmetric(horizontal: 10),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.pengirimanPage, arguments: {'product': controller.carts});
                              },
                              child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppColors.primary,
                                  ),
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Beli Sekarang',
                                        style: AppStyle.styleTextBody16(colorText: AppColors.white),
                                      ),
                                    ),
                                  ))))
                    ],
                  )),
            );
    });
  }
}

class CheckboxListTileWidget extends StatelessWidget {
  final bool checkboxValue;
  final void Function(bool?)? onChanged;
  final Widget title;
  final bool isThreeLine;

  const CheckboxListTileWidget({
    required this.checkboxValue,
    required this.onChanged,
    required this.title,
    this.isThreeLine = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checkboxValue,
      onChanged: onChanged,
      side: BorderSide.none,
      fillColor: MaterialStatePropertyAll(checkboxValue ? AppColors.yellow : AppColors.grey),
      title: title,
      activeColor: AppColors.yellow,
      isThreeLine: isThreeLine,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

class QtyButton extends StatefulWidget {
  const QtyButton({
    Key? key,
    required this.onMin,
    required this.onPlus,
    required this.qty,
  }) : super(key: key);

  final VoidCallback onMin;
  final VoidCallback onPlus;
  final String qty;

  @override
  _QtyButtonState createState() => _QtyButtonState();
}

class _QtyButtonState extends State<QtyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.yellow.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            child: IconButton(
              onPressed: () {
                widget.onMin();
                // _updateTextFieldValue(-1);
              },
              icon: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.remove,
                  size: 12,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 18,
            child: Center(
                child: Text(
              widget.qty,
            )
                // TextField(
                //   controller: widget.controller,
                //   keyboardType: TextInputType.number,
                //   onChanged: (newValue) {},
                //   style: const TextStyle(
                //     fontSize: 12,
                //     color: Colors.black,
                //   ),
                //   textAlign: TextAlign.center,
                //   decoration: const InputDecoration(
                //     border: InputBorder.none,
                //   ),
                // ),
                ),
          ),
          SizedBox(
            width: 32,
            child: IconButton(
              onPressed: () {
                // Call the onPlus callback
                widget.onPlus();
                // Manually update the TextField value
                // _updateTextFieldValue(1);
              },
              icon: const CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.yellow,
                child: Icon(
                  Icons.add,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    ).marginOnly(right: 20);
  }

  // Helper function to update the TextField value
  // void _updateTextFieldValue(int increment) {
  //   final currentValue = int.tryParse(widget.controller.text) ?? 0;
  //   final newValue = currentValue + increment;
  //   if (newValue > 0) {
  //     widget.controller.text = newValue.toString();
  //   }
  // }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    title: SizedBox(
      width: 200,
      child: GetBuilder<KeranjangPageController>(builder: (controller) {
        return Text(
          "Yakin Ingin Menghapus Produk?",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: AppStyle.styleTextBody16(),
        );
      }),
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
            child: GetBuilder<KeranjangPageController>(
              init: KeranjangPageController(),
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () {
                    controller.deleteCart();
                  },
                  style: AppStyle.styleButton(borderRadius: 18),
                  child: Text(
                    'Ya',
                    style: AppStyle.styleTextBody16(colorText: AppColors.white),
                  ),
                );
              },
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
