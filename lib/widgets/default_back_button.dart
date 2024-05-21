import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key, this.onRedirectBack});

  final Function()? onRedirectBack;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTapIconButton,
      color: Colors.black,
      style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  void onTapIconButton() {
    Get.back();
    onRedirectBack?.call();
  }
}
