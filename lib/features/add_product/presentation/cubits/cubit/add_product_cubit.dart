import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';

import '../../../domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(
    this.imagesRepo,
    this.productRepo,
  ) : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    var results = await imagesRepo.uploadImage(addProductInputEntity.image);

    results.fold((failure) => emit(AddProductFailure(failure.message)),
        (url) async {
      addProductInputEntity.imageUrl = url;
      var result = await productRepo.addProduct(addProductInputEntity);

      result.fold(
        (failure) => emit(
          AddProductFailure(failure.message),
        ),
        (result) => emit(
          AddProductSuccess(),
        ),
      );
    });
  }
}
