import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  var formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;

  late String productName, productCode, productDescription;
  late num productPrice;
  bool isFeatured = false;
  File? productImage;

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
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productName = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                keyboardType: TextInputType.number,
                maxLines: 5,
                onSaved: (value) {
                  productDescription = value!;
                },
              ),
              const SizedBox(height: 16),
              IsFeatured(onChanged: (value) {
                isFeatured = value;
              }),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (value) {
                  productImage = value;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (productImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var input = AddProductInputEntity(
                        name: productName,
                        code: productCode,
                        description: productDescription,
                        price: productPrice,
                        isFeatured: isFeatured,
                        image: productImage!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an image'),
                      ),
                    );
                  }
                },
                text: "Add Product",
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
