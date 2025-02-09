import 'package:flutter/material.dart';

class ShoppingLeadingWidget extends StatelessWidget {
  const ShoppingLeadingWidget(
      {super.key,
      required this.paddingLeft,
      required this.event,
      required this.color});

  final double paddingLeft;
  final VoidCallback event;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: IconButton(
          onPressed: () {
            event();
          },
          icon: Icon(
            Icons.menu_sharp,
            color: color,
          )),
    );
  }
}
