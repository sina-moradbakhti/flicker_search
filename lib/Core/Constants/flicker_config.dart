class FlickerConfig {
  static const int itemsPerPage = 25;

  static const String flickerBaseUrl = 'https://www.flickr.com/services/rest/';
  static const String flickerApiKey = '1508443e49213ff84d566777dc211f2a';

  // All the methods listed here
  static const String searchMethod = 'flickr.photos.search';
  static const String recentMethod = 'flickr.photos.getRecent';

  static String flickerRestUrlMaker(
    String fmethod, {
    String? searchTerms,
    int perPage = FlickerConfig.itemsPerPage,
    String? page,
  }) =>
      '$flickerBaseUrl?method=$fmethod&api_key=$flickerApiKey&text=$searchTerms&per_page=$perPage&page=$page&format=json&nojsoncallback=1';
}
