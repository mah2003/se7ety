import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorDialog(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
  ));
}

ShowLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('Assets/loading.json', width: 200, height: 200)
            ],
          ));
}
