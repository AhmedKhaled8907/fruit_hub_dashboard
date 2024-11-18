import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.onSaved,
    this.obscureText = false,
    this.maxLines = 1,
  });

  final String hintText;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      keyboardType: textInputType,
      style: TextStyles.semiBold16,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        labelText: hintText,
        labelStyle: TextStyles.semiBold16.copyWith(
          color: AppColors.greyColor,
        ),
        filled: true,
        fillColor: AppColors.textFormFieldColor,
        enabledBorder: outline(),
        focusedBorder: outline(),
        border: outline(),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outline() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Color(0xffE6E9EA),
      ),
    );
  }
}
