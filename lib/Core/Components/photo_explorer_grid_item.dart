import 'package:cached_network_image/cached_network_image.dart';
import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flicker_search/Core/Utils/extensions.dart';
import 'package:flutter/material.dart';

class PhotoExplorerGridItem extends StatelessWidget {
  final FlickerPhotoModel model;
  const PhotoExplorerGridItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
          errorWidget: (context, url, error) =>
              Container(color: Colors.black12),
          imageUrl: model.flickerImagePath,
          fit: BoxFit.cover),
    );
  }
}
