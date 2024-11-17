import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.addProducts,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
