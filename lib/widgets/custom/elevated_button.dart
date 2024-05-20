import 'package:flutter/material.dart';

import '../../utils/screen.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? buttonColor;
  final String? buttonText;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? textColor;
  final double? borderRadius;
  final double? textWidth;
  final VoidCallback? onPressed;
  final double? padding;
  final double? fontSize;
  const CustomElevatedButton({
    super.key,
    this.buttonColor,
    this.buttonText,
    this.buttonWidth,
    this.buttonHeight,
    this.textColor,
    this.borderRadius,
    this.textWidth,
    this.onPressed,
    this.padding,
    this.fontSize = 0,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor!),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? ScreenUtil.safeBlockHorizontal * 3,
            ),
          ),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius ?? ScreenUtil.safeBlockHorizontal * 3,
            ),
            border: Border.all(
              width: 1,
            )),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding ?? ScreenUtil.safeBlockHorizontal * 5),
          width: buttonWidth,
          height: buttonHeight,
          alignment: Alignment.center,
          child: fontSize! > 0
              ? Text(
                  buttonText!,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontFamily: 'Raleway',
                  ),
                )
              : SizedBox(
                  width: textWidth ?? double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      buttonText!,
                      style: TextStyle(
                        fontSize: ScreenUtil.safeBlockHorizontal * 5,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
