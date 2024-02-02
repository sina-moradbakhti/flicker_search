import 'package:flicker_search/Core/Constants/dimentions.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? hint;
  final bool disabled;
  final Function(String)? onChanged;

  const CustomSearchField(
      {super.key, this.hint, this.onChanged, this.disabled = false});

  @override
  TextField build(BuildContext context) {
    return TextField(
      enabled: !disabled,
      onSubmitted: onChanged,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: AppDimentions.customSearchFieldPadding,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          )),
    );
  }
}
