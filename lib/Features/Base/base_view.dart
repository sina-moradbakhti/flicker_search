import 'package:flicker_search/Core/Constants/strings.dart';
import 'package:flicker_search/Core/Constants/themes.dart';
import 'package:flicker_search/Features/PhotoExplorer/photo_explorer_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: AppThemes.defaultMaterialTheme,
      home: PhotoExplorerView(),
    );
  }
}
