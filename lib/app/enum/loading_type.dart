enum LoadingType {
  inactive,
  loading,
  loaded,
  error,
  empty,
}

extension LoadingTypeExtension on LoadingType {
  bool get isLoading => this == LoadingType.loading;

  bool get isLoaded => this == LoadingType.loaded;

  bool get isError => this == LoadingType.error;

  bool get isEmpty => this == LoadingType.empty;
}
