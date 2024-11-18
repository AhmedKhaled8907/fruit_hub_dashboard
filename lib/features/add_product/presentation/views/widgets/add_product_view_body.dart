import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                onSaved: (value) {
                  name = value!;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price (\$)',
                onSaved: (value) {
                  price = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                onSaved: (value) {
                  code = value!;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Expiration Months',
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Unit Amount',
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Number Of Calories (g)',
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                onSaved: (value) {
                  description = value!;
                },
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ProductEntity input = ProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationsMonths: expirationMonths.toInt(),
                        isOrganic: isOrganic,
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                      );

                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
