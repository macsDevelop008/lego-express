import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lego_express/configuration/configuration.dart';

Future<void> showLoadingDialog(BuildContext context) async {
  final size = ScreenResponsive.height(context: context, percentaje: 0.08);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: SizedBox.expand(
          child: Container(
            color: Colors.black26, //AppColors.first.withOpacity(0.4),
            child: SpinKitChasingDots(
              color: AppColors(context: context).fifth, //AppColors.twelfth,
              size: size,
            ),
          ),
        ),
      );
    },
  );
}
