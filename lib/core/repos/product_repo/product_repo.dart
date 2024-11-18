import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  );
}
