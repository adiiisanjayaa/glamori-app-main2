import 'package:get/get.dart';

import '../modules/articlePage/bindings/article_page_binding.dart';
import '../modules/articlePage/views/article_page_view.dart';
import '../modules/createPasswordPage/bindings/create_password_page_binding.dart';
import '../modules/createPasswordPage/views/create_password_page_view.dart';
import '../modules/detailBelanjaPage/bindings/detail_belanja_page_binding.dart';
import '../modules/detailBelanjaPage/views/detail_belanja_page_view.dart';
import '../modules/detailRedeemPage/bindings/detail_redeem_page_binding.dart';
import '../modules/detailRedeemPage/views/detail_redeem_page_view.dart';
import '../modules/faqPage/bindings/faq_page_binding.dart';
import '../modules/faqPage/views/faq_page_view.dart';
import '../modules/keranjangPage/bindings/keranjang_page_binding.dart';
import '../modules/keranjangPage/views/keranjang_page_view.dart';
import '../modules/pengirimanPage/bindings/pengiriman_page_binding.dart';
import '../modules/pengirimanPage/views/pengiriman_page_view.dart';
import '../modules/pesananKonsultasiPage/bindings/pesanan_konsultasi_page_binding.dart';
import '../modules/pesananKonsultasiPage/views/pesanan_konsultasi_page_view.dart';
import '../modules/promotionPage/bindings/promotion_page_binding.dart';
import '../modules/promotionPage/views/promotion_page_view.dart';
import '../modules/redeemPage/bindings/redeem_page_binding.dart';
import '../modules/redeemPage/views/redeem_page_view.dart';
import '../modules/registerPage/bindings/register_page_binding.dart';
import '../modules/registerPage/views/register_page_view.dart';
import '../modules/resetPasswordEmail/bindings/reset_password_email_binding.dart';
import '../modules/resetPasswordEmail/views/reset_password_email_view.dart';
import '../modules/resetPasswordPin/bindings/reset_password_pin_binding.dart';
import '../modules/resetPasswordPin/views/reset_password_pin_view.dart';
import '../modules/rootPage/bindings/root_page_binding.dart';
import '../modules/rootPage/views/root_page_view.dart';
import '../modules/treatmentOnsiteDetail/bindings/treatment_onsite_detail_binding.dart';
import '../modules/treatmentOnsiteDetail/views/treatment_onsite_detail_view.dart';
import '../modules/treatmentPages/bindings/treatment_pages_binding.dart';
import '../modules/treatmentPages/views/treatment_pages_view.dart';
import '../modules/treatmentVirtualDetail/bindings/treatment_virtual_detail_binding.dart';
import '../modules/treatmentVirtualDetail/views/treatment_virtual_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.rootPage;

  static final routes = [
    GetPage(
      name: _Paths.rootPage,
      page: () => const RootPageView(),
      binding: RootPageBinding(),
    ),
    GetPage(
      name: _Paths.registerPage,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: _Paths.resetPasswordEmail,
      page: () => const ResetPasswordEmailView(),
      binding: ResetPasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.resetPasswordPin,
      page: () => const ResetPasswordPinView(),
      binding: ResetPasswordPinBinding(),
    ),
    GetPage(
      name: _Paths.createPasswordPages,
      page: () => const CreatePasswordPageView(),
      binding: CreatePasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.redeemPage,
      page: () => const RedeemPageView(),
      binding: RedeemPageBinding(),
    ),
    GetPage(
      name: _Paths.createPasswordPage,
      page: () => const CreatePasswordPageView(),
      binding: CreatePasswordPageBinding(),
    ),
    GetPage(
      name: _Paths.detailRedeemPage,
      page: () => const DetailRedeemPageView(),
      binding: DetailRedeemPageBinding(),
    ),
    GetPage(
      name: _Paths.promotionPage,
      page: () => const PromotionPageView(),
      binding: PromotionPageBinding(),
    ),
    GetPage(
      name: _Paths.articlePage,
      page: () => const ArticlePageView(),
      binding: ArticlePageBinding(),
    ),
    GetPage(
      name: _Paths.detailBelanjaPage,
      page: () => const DetailBelanjaPageView(),
      binding: DetailBelanjaPageBinding(),
    ),
    GetPage(
      name: _Paths.pengirimanPage,
      page: () => const PengirimanPageView(),
      binding: PengirimanPageBinding(),
    ),
    GetPage(
      name: _Paths.keranjangPage,
      page: () => const KeranjangPageView(),
      binding: KeranjangPageBinding(),
    ),
    GetPage(
      name: _Paths.faqPage,
      page: () => const FaqPageView(),
      binding: FaqPageBinding(),
    ),
    GetPage(
      name: _Paths.treatmentPage,
      page: () => const TreatmentPagesView(),
      binding: TreatmentPagesBinding(),
    ),
    GetPage(
      name: _Paths.treatmentVirtualDetail,
      page: () => const TreatmentVirtualDetailView(),
      binding: TreatmentVirtualDetailBinding(),
    ),
    GetPage(
      name: _Paths.treatmentOnsiteDetail,
      page: () => const TreatmentOnsiteDetailView(),
      binding: TreatmentOnsiteDetailBinding(),
    ),
    GetPage(
      name: _Paths.pesananKonsultasiPage,
      page: () => const PesananKonsultasiPageView(),
      binding: PesananKonsultasiPageBinding(),
    ),
  ];
}
