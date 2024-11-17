import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/errors/failure.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:fruit_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl extends ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl(this.storageService);
  
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      var imageUrl = await storageService.uploadFile(
        BackendEndpoint.images,
        image,
      );
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image: $e'));
    }
  }
}
