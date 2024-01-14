import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_schedule.dart';
import 'package:glamori/app/data/services/api_services.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:intl/intl.dart';

class TreatmentPagesController extends GetxController {
  ApiServices apiServices = ApiServices();
  ScheduleModel? schedule;
  List<String> dateAppoinment = [
    '3',
    '1',
    '2',
    '2',
  ];

  List<String> itemsTreatment = ['On-site Appointment', 'Virtual Appointment'];
  String? selectedItemTreatment;

  setTreatment(value) {
    selectedItemTreatment = value;
    update();
  }

  TextEditingController dateTreatmentController = TextEditingController();

  Future<void> selectDateTreatment(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime lastDate = DateTime(now.year + 3, now.month, now.day, 23, 59, 59);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.yellow,
            colorScheme: const ColorScheme.light(primary: AppColors.yellow),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null) {
      init(date: picked);
      dateTreatmentController.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  init({DateTime? date}) async {
    dateTreatmentController.clear();
    try {
      schedule = await apiServices.getSchedule(date: date);
      update();
    } catch (_) {}
  }

  String dateFormat(String? date) {
    final f = DateFormat('E, dd MMM yyyy');
    return f.format(DateTime.tryParse(date ?? '') ?? DateTime.now());
  }

  String timeFormat(String? date) {
    final f = DateFormat('hh:mm a');
    return f.format(DateTime.tryParse(date ?? '') ?? DateTime.now());
  }
}
