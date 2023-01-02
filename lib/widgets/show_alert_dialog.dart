import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showAlertDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SpinKitCircle(
          size: 120,
          color: Color(0xFFCA987E),
        ),
      );
    },
  );
}
