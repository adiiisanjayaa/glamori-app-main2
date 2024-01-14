import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:glamori/core/themes/style.dart';

import '../controllers/faq_page_controller.dart';

class FaqPageView extends GetView<FaqPageController> {
  const FaqPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        title: Text(
          'FAQ',
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
      body: GetBuilder<FaqPageController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildPanel(),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _buildPanel() {
  return GetBuilder<FaqPageController>(builder: (controller) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 3.5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text(
              'Bagaimana cara membuat akun?',
              style: AppStyle.styleTextBody14(),
            ),
            shape: Border.all(color: Colors.transparent),
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: const Column(
                  children: [
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Buka aplikasi Glamoris App',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Pilih Daftar',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Lalu Isi Data Diri',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Setelah selesai pilih Daftar',
                    ),
                    CustomBulletTitleStart(
                      bulletColor: AppColors.textBlack,
                      text: 'Kode Otentikasi akan dikirimkan pada nomor yang Anda daftarkan',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Masukan Kode Otentikasi',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Pilih Lanjutkan',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Akun Glamori App Anda sudah terdaftar.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).marginSymmetric(horizontal: 20, vertical: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 3.5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text(
              'Bagaimana cara Log in ke akun Glamori App?',
              style: AppStyle.styleTextBody14(),
            ),
            shape: Border.all(color: Colors.transparent),
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Anda dapat masuk ke akun Glamori's App dengan cara:",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Melalui Email:",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ).marginSymmetric(vertical: 10),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Buka aplikasi Glamoris App',
                    ),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Masukan Email ',
                    ),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Masukan Password ',
                    ),
                    const CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Klik Masuk.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).marginSymmetric(horizontal: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 3.5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text(
              'Mengapa saya tidak bisa Login?',
              style: AppStyle.styleTextBody14(),
            ),
            shape: Border.all(color: Colors.transparent),
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upaya Log in yang gagal ke akun Glamori’s App Anda dapat terjadi karena alasan berikut:",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Password salah:",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ).marginOnly(top: 10),
                    const Text(
                      "Periksa kembali apakah Anda telah memasukkan password dengan benar.",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Salah no. telepon",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ).marginOnly(top: 10),
                    const Text(
                      "Periksa kembali apakah Anda sudah memasukkan no. telepon yang terdaftar.",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Kode verifikasi (OTP) sudah kedaluwarsan",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ).marginOnly(top: 10),
                    const Text(
                      "Pastikan Anda memasukkan Kode verifikasi yang sudah dikirimkan melalui WhatsApp atau SMS dalam batas waktu yang sudah ditentukan.",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Akun Anda mungkin dibatasi",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ).marginSymmetric(vertical: 10),
                    const CustomBulletTitleStart(
                      bulletColor: AppColors.textBlack,
                      text: 'Alasan keamanan, seperti aktivitas Log in yang mencurigakan atau dugaan upaya peretasan.',
                    ),
                    const CustomBulletTitleStart(
                      bulletColor: AppColors.textBlack,
                      text: 'Alasan lain, seperti pelanggaran kebijakan Glamori’s App.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).marginSymmetric(horizontal: 20, vertical: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 3.5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text(
              'Bagaimana cara reset password akun jika saya lupa password?',
              style: AppStyle.styleTextBody14(),
            ),
            shape: Border.all(color: Colors.transparent),
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jika Anda belum login dan lupa password akun Anda, ikutilah langkah-langkah berikut:",
                      style: TextStyle(fontSize: 12),
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Klik Lupa Password?',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Masukkan email yang terdaftar di akun Anda',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Klik Lanjut',
                    ),
                    CustomBulletTitleStart(
                      bulletColor: AppColors.textBlack,
                      text: 'Masukkan Kode OTP yang dikirimkan ke email andal ',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'Atur Password baru',
                    ),
                    CustomBulletTitle(
                      bulletColor: AppColors.textBlack,
                      text: 'OK.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).marginSymmetric(horizontal: 20),
      ],
    );
  });
}

class CustomBulletTitle extends StatelessWidget {
  const CustomBulletTitle({
    Key? key,
    required this.bulletColor,
    required this.text,
  }) : super(key: key);

  final Color bulletColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: bulletColor,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.black), // You can customize the style here
          ),
        ),
      ],
    );
  }
}

class CustomBulletTitleStart extends StatelessWidget {
  const CustomBulletTitleStart({
    Key? key,
    required this.bulletColor,
    required this.text,
  }) : super(key: key);

  final Color bulletColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 3,
          backgroundColor: bulletColor,
        ).marginOnly(top: 5),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.black), // You can customize the style here
          ),
        ),
      ],
    );
  }
}
