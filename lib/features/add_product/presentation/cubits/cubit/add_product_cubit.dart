import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';

import '../../../domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity entity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(entity.image);
    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (url) async {
        entity.imageUrl = url;
        var productResult = await productsRepo.addProduct(entity);
        productResult.fold(
          (failure) => emit(AddProductFailure(failure.message)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
