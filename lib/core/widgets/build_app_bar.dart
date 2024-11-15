import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool? showLeading = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    // toolbarHeight: kToolbarHeight,
    title: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        title,
        style: TextStyles.bold19,
      ),
    ),
    centerTitle: true,
    leading: showLeading!
        ? Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        : const SizedBox.shrink(),
  );
}
