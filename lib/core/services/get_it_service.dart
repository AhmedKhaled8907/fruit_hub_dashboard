import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/database_service.dart';
import 'package:fruit_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruit_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorage());

  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt<StorageService>()),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt<FirestoreService>()),
  );
}
