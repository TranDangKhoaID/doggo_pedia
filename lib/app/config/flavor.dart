enum Flavor { dev, stag, production }

class FlavorValues {
  final String domainApp;
  final String baseUrl;
  final String dynamicLink;
  final String appStoreId;
  final String? androidPackageId;
  final String? iosBundleId;

  FlavorValues({
    required this.domainApp,
    required this.baseUrl,
    required this.dynamicLink,
    required this.appStoreId,
    this.androidPackageId,
    this.iosBundleId,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String name,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(flavor, name, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  // Getter tĩnh trả về thể hiện (instance) của FlavorConfig.
  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance?.flavor == Flavor.production;
  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
  static bool isStaging() => _instance?.flavor == Flavor.stag;
}

void setFlavorDevelopment() {
  const String domainApp = "https://api.thedogapi.com";

  FlavorConfig(
    flavor: Flavor.dev,
    name: "Development",
    values: FlavorValues(
      domainApp: domainApp,
      baseUrl: domainApp,
      dynamicLink: "0",
      appStoreId: "0",
    ),
  );
}
