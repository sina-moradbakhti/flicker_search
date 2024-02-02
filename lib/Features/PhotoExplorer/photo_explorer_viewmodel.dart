import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Features/PhotoExplorer/data/photo_explorer_service_impl.dart';
import 'package:flicker_search/Features/PhotoExplorer/photo_explorer_model.dart';
import 'package:get/get.dart';

class PhotoExplorerViewModel extends GetxController {
  RxList<FlickerPhotoModel> photos = <FlickerPhotoModel>[].obs;

  late PhotoExplorerServiceImpl _photoExplorerService;
  late PhotoExplorerModel _model;
  PhotoExplorerModel get model => _model;

  PhotoExplorerViewModel() {
    _model = PhotoExplorerModel();
    _photoExplorerService = PhotoExplorerServiceImpl();
  }

  recentPhotos() async =>
      _updateModelPhotos(await _photoExplorerService.getRecentPhotos());

  search(String searchTerm) async =>
      _updateModelPhotos(await _photoExplorerService.searchPhotos(searchTerm));

  @override
  void onInit() {
    super.onInit();
    recentPhotos();
  }

  _updateModelPhotos(List<FlickerPhotoModel> newList) {
    model.photos.clear();
    model.photos.addAll(newList);
    update();
  }
}
