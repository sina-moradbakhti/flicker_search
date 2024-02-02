import 'package:flicker_search/Core/Constants/flicker_config.dart';
import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Core/Data/Services/service_helper.dart';
import 'package:flicker_search/Core/Utils/enums.dart';
import 'package:flicker_search/Features/PhotoExplorer/Repositories/photo_explorer_service_repo.dart';

class PhotoExplorerServiceImpl implements PhotoExplorerServiceRepo {
  @override
  Future<List<FlickerPhotoModel>> getRecentPhotos() async {
    final result = await ServiceHelper().request(
      FlickerConfig.flickerRestUrlMaker(FlickerConfig.recentMethod),
      method: HttpRequestMethod.get,
    );

    List<FlickerPhotoModel> output = [];

    if (result?['photos'] != null) {
      for (final photo in result?['photos']['photo']) {
        output.add(FlickerPhotoModel.fromJson(photo));
      }
    }

    return output;
  }

  @override
  Future<List<FlickerPhotoModel>> searchPhotos(String searchTerms) async {
    final result = await ServiceHelper().request(
      FlickerConfig.flickerRestUrlMaker(
        FlickerConfig.searchMethod,
        searchTerms: searchTerms,
      ),
      method: HttpRequestMethod.get,
    );

    List<FlickerPhotoModel> output = [];

    if (result?['photos'] != null) {
      for (final photo in result?['photos']['photo']) {
        output.add(FlickerPhotoModel.fromJson(photo));
      }
    }

    return output;
  }
}
