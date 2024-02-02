class FlickerImageViewerHelper {
  static final FlickerImageViewerHelper _singleton =
      FlickerImageViewerHelper._internal();
  factory FlickerImageViewerHelper() => _singleton;
  FlickerImageViewerHelper._internal();

  String make({
    required int farm,
    required String server,
    required String id,
    required String secret,
  }) =>
      'https://farm$farm.staticflickr.com/$server/${id}_$secret.jpg';
}
