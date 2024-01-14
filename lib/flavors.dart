// ignore_for_file: constant_identifier_names

enum Flavor {
  app_release,
  app_staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.app_release:
        return 'Glamori';
      case Flavor.app_staging:
        return 'Glamori';
      default:
        return 'title';
    }
  }
}
