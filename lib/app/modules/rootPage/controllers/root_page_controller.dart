import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_get_all_product.dart';
import 'package:glamori/app/data/model/model_get_profile.dart';
import 'package:glamori/app/data/model/model_user.dart';
import 'package:glamori/app/data/services/api_services.dart';
import 'package:glamori/app/data/services/user_services.dart';
import 'package:glamori/app/data/stirage_method.dart';
import 'package:glamori/app/modules/rootPage/views/widgets/belanja_widget.dart';
import 'package:glamori/app/modules/rootPage/views/widgets/home_widget.dart';
import 'package:glamori/app/modules/rootPage/views/widgets/login_widget.dart';
import 'package:glamori/app/modules/rootPage/views/widgets/profile_widget.dart';
import 'package:glamori/app/modules/rootPage/views/widgets/transaksi_widget.dart';
import 'package:glamori/app/modules/treatmentPages/views/treatment_pages_view.dart';
import 'package:glamori/app/routes/app_pages.dart';
import 'package:glamori/core/assets.dart';
import 'package:glamori/core/themes/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RootPageController extends GetxController {
  // final loginFormKey = GlobalKey<FormState>();

  //navbar
  int selectedIndex = 0;
  List<IconModel> get icons => [
        IconModel(id: 0, icon: Assets.icHome, size: 24.0, label: 'Home'),
        IconModel(id: 1, icon: Assets.icTreatment, size: 24.0, label: 'Treatment'),
        IconModel(id: 2, icon: Assets.icBelanja, size: 24.0, label: 'Belanja'),
        IconModel(id: 3, icon: Assets.icTransaksi, size: 24.0, label: 'Transaksi'),
        IconModel(id: 4, icon: Assets.icProfile, size: 22.0, label: 'Akun'),
      ];

  List<Widget> pages = [
    const HomeWidget(),
    const TreatmentPagesView(),
    const BelanjaWidget(),
    const TransaksiWidget(),
    const ProfileWidget(), // Default widget
  ];
  onItemTapped(int value) {
    selectedIndex = value;
    update();
  }

//image coursel home
  int currentIndex = 0;

  final List<String> imageUrls = [
    'https://www.figma.com/file/Iohx8FcSM6RLuhajOA8kn9/Glamori-Klinik?type=design&node-id=1806-1158&mode=dev',
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
    'https://example.com/image3.jpg',
  ];
  final List<String> profileUrls = [
    'https://www.figma.com/file/Iohx8FcSM6RLuhajOA8kn9/Glamori-Klinik?type=design&node-id=1806-1158&mode=dev',
    'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
  ];

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex = index;
    update();
  }

  Future<void> handleRefresh() async {}

  List<BelanjaItem> belanjaItems = [
    BelanjaItem(id: 1, title: "Semua Product"),
    BelanjaItem(id: 2, title: "Perawatan Wajah", icon: ""),
    BelanjaItem(id: 3, title: "Perawatan Kulit", icon: ""),
    BelanjaItem(id: 4, title: "Perawatan Kulit", icon: ""),
  ];

  BelanjaItem? selectedBelanjaItem;

  setSelectedBelanjaItem(val) {
    selectedBelanjaItem = val;
    update();
  }

//date dan jenis kelamin
  List<String> items = ['perempuan', 'laki-laki'];
  String? selectedItem;
  TextEditingController dateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
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
    if (picked != null && picked != dateController.text) {
      dateController.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  setKelamin(value) {
    selectedItem = value;
    update();
  }

  TextEditingController passwordLoginController = TextEditingController();
  bool passwordLoginVisible = true;

  passwordLoginVisibility() {
    passwordLoginVisible = !passwordLoginVisible;
    update();
  }

//Value text feild
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController teleponController = TextEditingController();

  TextEditingController passwordControllerProfile = TextEditingController();
  bool passwordVisible = true;
  TextEditingController passwordKonfirmasiController = TextEditingController();
  bool passwordKonfirmasiVisible = true;
  TextEditingController passwordKataSandiBaruController = TextEditingController();
  bool passwordKataSandiBaruVisible = true;

  void editProfile(BuildContext context) async {
    var dataLogin = await UserService.find.getLocalUser();
    var result = await ApiServices.editProfile(
      fullname: namaController.text,
      phone: teleponController.text,
      birthdate: dateController.text,
      gender: selectedItem ?? '',
      email: emailController.text,
      id: dataLogin?.id,
    );

    if (result) {
      Get.toNamed(Routes.rootPage);
      var getPage = Get.find<RootPageController>();
      getPage.onItemTapped(4);
      update();
    }

    update();
  }

  void changePassword(BuildContext context) async {
    var dataLogin = await UserService.find.getLocalUser();
    var result = await ApiServices.changePassword(
      oldPassword: passwordController.text,
      newPassword: passwordKataSandiBaruController.text,
      id: dataLogin?.id,
    );

    if (result) {
      EasyLoading.showSuccess('Berhasil Mengubah Password');

      update();
    }

    update();
  }

  passwordVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  passwordKonfirmasiVisibility() {
    passwordKonfirmasiVisible = !passwordKonfirmasiVisible;
    update();
  }

  passwordKataSandiBaruVisibility() {
    passwordKataSandiBaruVisible = !passwordKataSandiBaruVisible;
    update();
  }

  String? imagePath;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      // Update the image path

      imagePath = pickedImage.path;

      update();
      // print("Image selected: ${pickedImage.path}");

      File? imageFile = File(imagePath ?? '');

      bool success = await ApiServices.editImageProfile(image: imageFile, id: UserService.find.user?.id ?? '');
      // print(id);

      if (success) {
        // print('Image profile updated successfully');
      } else {
        // print('Failed to update image profile');
      }
    } else {
      // print("No image selected");
    }
  }

  Future<void> cameraImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      // Update the image path
      imagePath = pickedImage.path;
      update();
      // print("Image selected: ${pickedImage.path}");
      File? imageFile = File(imagePath ?? '');

      bool success = await ApiServices.editImageProfile(image: imageFile, id: id);
      // print(id);

      if (success) {
        // print('Image profile updated successfully');
      } else {
        // print('Failed to update image profile');
      }
    } else {
      // print("No image selected");
    }
  }

  TextEditingController phoneController = TextEditingController();

  void login(BuildContext context) async {
    var result = await ApiServices.login(phone: phoneController.text, password: passwordLoginController.text);
    // print(teleponController.text);
    if (result != null) {
      if (result.message == "Login Success") {
        // print('berhasil');
        var user = ModelUser(
          token: result.data?.accessToken,
          fullname: result.data?.patient?.fullname,
          phone: result.data?.patient?.phone,
          id: result.data?.patient?.sId,
          email: result.data?.patient?.email,
          memberId: result.data?.patient?.memberId,
          patientId: result.data?.patient?.patientId,
          isLogin: true,
        );
        isLogin = true;
        await StorageMethod.saveUserToLocal(user);

        if (isLogin == true) {
          var dataLogin = await UserService.find.getLocalUser();
          if (dataLogin != null) {
            getProfile(UserService.find.user?.id ?? '');
          }
          pages = const [
            HomeWidget(),
            TreatmentPagesView(),
            BelanjaWidget(),
            TransaksiWidget(),
            ProfileWidget(),
          ];
        } else {
          pages = const [
            HomeWidget(),
            TreatmentPagesView(),
            BelanjaWidget(),
            TransaksiWidget(),
            LoginWidget(),
          ];
        }

        isLogin = true;
        Get.toNamed(Routes.rootPage);
        selectedIndex = 4;
        update();
      }
    }
    update();
  }

  List<String> itemsTreatment = ['On-site Appointment', 'Virtual Appointment'];
  String? selectedItemTreatment;

  List<String> dateAppoinment = [
    '3',
    '1',
    '2',
    '2',
  ];

  int currentData = 0;
  setTreatment(value) {
    selectedItemTreatment = value;
    update();
  }

  setCurrentData(int val) {
    currentData = val;
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

    if (picked != null && picked != dateTreatmentController.text) {
      dateTreatmentController.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  final count = 0.obs;

  void increment() => count.value++;

  ModelGetProfile? users;
  getProfile(String id) async {
    var data = await ApiServices().getProfile(id);
    users = data;
    update();
  }

  ModelGetAllProduct? allProudct;
  getAllProduct() async {
    var data = await ApiServices().getAllProduct();
    allProudct = data;
    update();
  }

  bool isLogin = false;
  String id = '';
  String nameUser = '';
  @override
  void onReady() async {
    var dataLogin = await UserService.find.getLocalUser();

    if (dataLogin != null) {
      isLogin = UserService.find.user?.isLogin ?? false;
      id = UserService.find.user?.id ?? "";
      nameUser = UserService.find.user?.fullname ?? "";
      getProfile(UserService.find.user?.id ?? '');
    }

    if (isLogin) {
      pages[pages.length - 1] = const ProfileWidget();
    } else {
      pages[pages.length - 1] = const LoginWidget();
    }
    update();
    super.onReady();
  }

  String formatDate(String? inputDate) {
    if (inputDate == null || inputDate.isEmpty) {
      return '';
    }

    // Assuming your inputDate is in the format 'yyyy-MM-ddTHH:mm:ss'
    DateTime date = DateTime.parse(inputDate);
    // print(date);

    // Format the date without time and seconds
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);

    // Return the formatted date as a string
    return formattedDate;
  }

  String formatPrice(int productPrice) {
    final formatter = NumberFormat.currency(
      symbol: 'Rp.',
      decimalDigits: 0,
      locale: 'id_ID', // Use the locale for Indonesia to ensure dot as thousand separator
    );
    return formatter.format(productPrice);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    namaController.text = users?.data?.fullname ?? '';
    emailController.text = users?.data?.email ?? '';
    teleponController.text = users?.data?.phone ?? '';
    dateController.text = formatDate(users?.data?.date);
    selectedItem = users?.data?.gender ?? 'perempuan';
    passwordLoginVisible = false;
    getAllProduct();
    super.onInit();
  }

  initEdit() async {
    if (users == null) {
      await getProfile(UserService.find.user?.id ?? '');
    }

    namaController.text = users?.data?.fullname ?? '';
    emailController.text = users?.data?.email ?? '';
    teleponController.text = users?.data?.phone ?? '';
    dateController.text = users?.data?.date ?? '';
    selectedItem = users?.data?.gender ?? 'perempuan';
  }
}

class IconModel {
  final int id;
  final String icon;
  final String label;
  final double size;

  IconModel({required this.id, required this.icon, required this.label, required this.size});
}

class BelanjaItem {
  final int id;
  final String title;
  final String? icon;

  BelanjaItem({
    required this.id,
    required this.title,
    this.icon,
  });
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer? _timer;

  Debouncer({this.milliseconds = 300, required this.action});

  void run() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
