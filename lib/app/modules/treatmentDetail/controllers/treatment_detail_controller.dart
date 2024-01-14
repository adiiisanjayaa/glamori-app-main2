import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_schedule.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:intl/intl.dart';

class TreatmentDetailController extends GetxController {
  Color colorPrimary = AppColors.blue;
  Color colorSecondary = AppColors.blueSoft;

  DetailDataSchedule? detail;

  @override
  void onReady() {
    try {
      Map<String, dynamic>? arguments = Get.arguments;
      detail = arguments?['detail'] as DetailDataSchedule?;

      if (detail?.isVirtual == true) {
        colorPrimary = AppColors.blue;
        colorSecondary = AppColors.blueSoft;
      } else {
        colorPrimary = AppColors.yellow;
        colorSecondary = AppColors.yellowSoft;
      }
      update();
    } catch (_) {}
    super.onReady();
  }

  String dateFormat() {
    final f = DateFormat('E, dd MMM yyyy');
    return f.format(DateTime.tryParse(detail?.scheduleDate ?? '') ?? DateTime.now());
  }

  String timeFormat() {
    final f = DateFormat('hh:mm a');
    return f.format(DateTime.tryParse(detail?.scheduleDate ?? '') ?? DateTime.now());
  }
}
