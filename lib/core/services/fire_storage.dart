import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(String path, File file) async {
    String fileName = b.basename(file.path);

    var fileReference = storageReference.child('$path/$fileName');

    await fileReference.putFile(file);

    var fileUrl = await fileReference.getDownloadURL();

    return fileUrl;
  }
}
