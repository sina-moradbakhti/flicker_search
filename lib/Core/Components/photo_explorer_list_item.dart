import 'package:cached_network_image/cached_network_image.dart';
import 'package:flicker_search/Core/Constants/strings.dart';
import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Core/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoExplorerListItem extends StatelessWidget {
  final FlickerPhotoModel model;
  const PhotoExplorerListItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: CachedNetworkImage(
            errorWidget: (context, url, error) =>
                Container(color: Colors.black12),
            imageUrl: model.flickerImagePath,
            fit: BoxFit.cover,
          ),
        ));
      },
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Container(color: Colors.black12),
        imageUrl: model.flickerImagePath,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Row(
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                )),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                model.title.isNotEmpty ? model.title : AppStrings.noTitle,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.titleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
