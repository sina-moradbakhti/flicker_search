import 'package:flicker_search/Core/Components/photo_explorer_grid_item.dart';
import 'package:flicker_search/Core/Constants/dimentions.dart';
import 'package:flicker_search/Core/Data/Models/flicker_photo_model.dart';
import 'package:flutter/material.dart';

class PhotoExplorerGrid extends StatelessWidget {
  final int? cellsInRow;
  final double? minSpacing;
  final List<FlickerPhotoModel> data;

  const PhotoExplorerGrid({
    super.key,
    required this.data,
    this.cellsInRow,
    this.minSpacing,
  });

  @override
  GridView build(BuildContext context) {
    return GridView.builder(
        padding: AppDimentions.photoExplorerGridPadding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cellsInRow ?? 3,
          mainAxisSpacing: minSpacing ?? 10,
          crossAxisSpacing: minSpacing ?? 10,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) =>
            PhotoExplorerGridItem(model: data[index]));
  }
}
