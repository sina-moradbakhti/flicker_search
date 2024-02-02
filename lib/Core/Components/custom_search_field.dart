import 'package:flicker_search/Core/Constants/dimentions.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? hint;
  final Function(String)? onChanged;

  const CustomSearchField({super.key, this.hint, this.onChanged});

  @override
  TextField build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: AppDimentions.customSearchFieldPadding,
      ),
      onChanged: onChanged,
    );
  }
}
