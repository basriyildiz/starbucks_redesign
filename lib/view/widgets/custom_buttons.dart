import 'package:flutter/material.dart';
import 'package:starbucks_redesign/core/constants/colors.dart';

class GreyButton extends ElevatedButton {
  GreyButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(
            key: key,
            onPressed: onTap,
            child: Text(
              title,
              style:
                  const TextStyle(color: darkGrey, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(primary: buttonGrey));
  final void Function() onTap;
  final String title;
}
