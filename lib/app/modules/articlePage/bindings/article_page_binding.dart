import 'package:get/get.dart';

import '../controllers/article_page_controller.dart';

class ArticlePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticlePageController>(
      () => ArticlePageController(),
    );
  }
}
