import 'package:flicker_search/Core/Components/custom_search_field.dart';
import 'package:flicker_search/Core/Components/photo_explorer_list.dart';
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
        title: Text(
          AppStrings.appTitle,
          style: Get.textTheme.headlineSmall,
        ),
        actions: [
          Obx(() => viewModel.loading.value
              ? const Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                )
              : Container())
        ],
      ),
      body: Column(
        children: [
          Obx(() => CustomSearchField(
                hint: AppStrings.customSearchFieldHint,
                onChanged: viewModel.search,
                disabled: viewModel.loading.value,
              )),
          Expanded(
              child: GetBuilder<PhotoExplorerViewModel>(
            init: viewModel,
            builder: (_) => PhotoExplorerList(
              data: viewModel.model.photos,
            ),
          ))
        ],
      ),
    );
  }
}
