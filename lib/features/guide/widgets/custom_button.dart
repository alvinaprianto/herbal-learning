import 'package:flutter/material.dart';
import 'package:hele/core/constants/color_constant.dart';

class CustomButton extends ElevatedButton {
  CustomButton({
    super.key,
    required Widget child,
    bool disabled = false,
    Function()? onPressed,
  }) : super(
            child: DefaultTextStyle.merge(
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              child: child,
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                elevation: 0,
                backgroundColor: ColorConstant.primaryColor,
                disabledBackgroundColor: ColorConstant.primaryColor,
                disabledForegroundColor: Colors.white),
            onPressed: disabled ? null : onPressed);
}
