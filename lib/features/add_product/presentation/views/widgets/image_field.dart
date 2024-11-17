import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
    required this.onFileChanged,
  });
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          await pickImage();
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textFormFieldColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffE6E9EA),
                ),
              ),
              child: fileImage != null
                  ? Image.file(
                      fileImage!,
                      fit: BoxFit.fill,
                    )
                  : const Icon(
                      Icons.image_outlined,
                      size: 160,
                    ),
            ),
            if (fileImage != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    fileImage = null;
                    widget.onFileChanged(fileImage);
                  });
                },
                child: removeIcon(),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    setState(() {
      isLoading = true;
    });
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    fileImage = File(image!.path);
    widget.onFileChanged(fileImage);
    setState(() {
      isLoading = false;
    });
  }

  Container removeIcon() {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        color: Colors.red,
      ),
      child: const Icon(
        Icons.remove_circle,
        color: Colors.white,
      ),
    );
  }
}
