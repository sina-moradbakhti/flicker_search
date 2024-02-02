import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Core/Data/Services/image_viewer_helper.dart';

extension FlickerImageViewerExtension on FlickerPhotoModel {
  String get flickerImagePath => FlickerImageViewerHelper()
      .make(farm: farm, server: server, id: id, secret: secret);
}
