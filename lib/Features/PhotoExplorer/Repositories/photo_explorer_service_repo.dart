import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';

abstract class PhotoExplorerServiceRepo {
  Future<List<FlickerPhotoModel>> getRecentPhotos();
  Future<List<FlickerPhotoModel>> searchPhotos(String searchTerms);
}
