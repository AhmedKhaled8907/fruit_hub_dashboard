import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  var formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'Product Code',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              const CustomTextFormField(
                hintText: 'Product Description',
                keyboardType: TextInputType.number,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (value) {},
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {},
                text: "Add Product",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
