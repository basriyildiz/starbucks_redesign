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
            style: ElevatedButton.styleFrom(primary: buttonGrey, elevation: 0));
  final void Function() onTap;
  final String title;
}

class CustomOutlinedButton extends ElevatedButton {
  CustomOutlinedButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(
            key: key,
            onPressed: onTap,
            child: Text(
              title,
              style: const TextStyle(color: dark, fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: buttonGrey),
              primary: white,
              elevation: 0,
            ));
  final void Function() onTap;
  final String title;
}
