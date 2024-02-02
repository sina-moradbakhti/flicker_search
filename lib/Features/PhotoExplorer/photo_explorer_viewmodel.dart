import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Features/PhotoExplorer/data/photo_explorer_service_impl.dart';
import 'package:flicker_search/Features/PhotoExplorer/photo_explorer_model.dart';
import 'package:get/get.dart';

class PhotoExplorerViewModel extends GetxController {
  RxBool loading = false.obs;

  late PhotoExplorerServiceImpl _photoExplorerService;
  late PhotoExplorerModel _model;
  PhotoExplorerModel get model => _model;

  PhotoExplorerViewModel() {
    _model = PhotoExplorerModel();
    _photoExplorerService = PhotoExplorerServiceImpl();
  }

  recentPhotos() async {
    loading.value = true;
    _updateModelPhotos(await _photoExplorerService.getRecentPhotos());
    loading.value = false;
  }

  search(String searchTerm) async {
    if (searchTerm.isEmpty) {
      recentPhotos();
      // If user clear search field, then show recent photos
    } else {
      if (searchTerm.length < 3 || loading.value) return;
      loading.value = true;
      _updateModelPhotos(await _photoExplorerService.searchPhotos(searchTerm));
      loading.value = false;
    }
  }

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
