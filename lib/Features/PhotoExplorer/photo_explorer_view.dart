import 'package:flicker_search/Core/Components/custom_search_field.dart';
import 'package:flicker_search/Core/Components/photo_explorer_grid.dart';
import 'package:flicker_search/Core/Constants/strings.dart';
import 'package:flicker_search/Features/PhotoExplorer/photo_explorer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoExplorerView extends StatelessWidget {
  PhotoExplorerView({super.key});

  final viewModel = Get.put(PhotoExplorerViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppStrings.appTitle, style: Get.textTheme.headlineSmall)),
      body: Column(
        children: [
          CustomSearchField(
            hint: AppStrings.customSearchFieldHint,
            onChanged: viewModel.search,
          ),
          Expanded(
              child: GetBuilder<PhotoExplorerViewModel>(
            init: viewModel,
            builder: (_) => PhotoExplorerGrid(
              data: viewModel.model.photos,
              cellsInRow: 3,
              minSpacing: 10,
            ),
          ))
        ],
      ),
    );
  }
}
