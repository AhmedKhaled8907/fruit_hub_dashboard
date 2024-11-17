import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage extends StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = b.basename(path);
    String fileExtension = b.extension(path);
    var fileRef = storageRef.child('$fileName.$fileExtension');
    fileRef.putFile(file);
    var imageUrl = await fileRef.getDownloadURL();
    return imageUrl;
  }
}
