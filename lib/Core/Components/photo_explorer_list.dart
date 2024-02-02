import 'package:flicker_search/Core/Components/photo_explorer_list_item.dart';
import 'package:flicker_search/Core/Constants/dimentions.dart';
import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flutter/material.dart';

class PhotoExplorerList extends StatelessWidget {
  final List<FlickerPhotoModel> data;

  const PhotoExplorerList({
    super.key,
    required this.data,
  });

  @override
  ListView build(BuildContext context) {
    return ListView.separated(
      padding: AppDimentions.photoExplorerGridPadding,
      itemCount: data.length,
      itemBuilder: (context, index) =>
          PhotoExplorerListItem(model: data[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}
