import 'package:flutter/material.dart';

enum ButtonStyleType { filled, outlined, transparent }
enum ButtonColor { primary, secondary }
enum ButtonPurpose { add, none, add_alarm_rounded, add_photo_alternate, image }

class CustomButton extends StatelessWidget {
  final ButtonStyleType styleType;
  final ButtonColor buttonColor;
  final ButtonPurpose purpose;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? buttonSize;
  final String? imagePath;
  final String buttonText;

  CustomButton({
    Key? key,
    required this.styleType,
    required this.buttonText,
    this.buttonColor = ButtonColor.primary,
    this.purpose = ButtonPurpose.none,
    this.onPressed,
    this.borderRadius,
    this.buttonSize,
    this.imagePath,
  }) : super(key: key);

  Widget _iconForPurpose(ButtonPurpose purpose) {
    switch (purpose) {
      case ButtonPurpose.add:
        return Icon(Icons.add, color: _iconColor());
      case ButtonPurpose.add_alarm_rounded:
        return Icon(Icons.add_alarm_rounded, color: _iconColor());
      case ButtonPurpose.add_photo_alternate:
        return Icon(Icons.add_photo_alternate, color: _iconColor());
      case ButtonPurpose.image:
        if (imagePath != null) {
          return Image.asset(imagePath!, width: 24, height: 24);
        } else {
          return Icon(Icons.clear);
        }
      case ButtonPurpose.none:
      default:
        return Icon(Icons.clear);
    }
  }

  Color _iconColor() {
    if (styleType == ButtonStyleType.filled) {
      if (buttonColor == ButtonColor.primary) {
        return Colors.white;
      } else {
        return Colors.white70;
      }
    }
    return buttonColor == ButtonColor.primary ? Colors.blue : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    Color textColor;
    BorderSide borderSide;

    Color baseColor = buttonColor == ButtonColor.primary ? Colors.blue : Colors.grey;

    switch (styleType) {
      case ButtonStyleType.filled:
        primaryColor = baseColor;
        textColor = buttonColor == ButtonColor.primary ? Colors.white : Colors.white70;
        borderSide = BorderSide(color: baseColor, width: 2.0);
        break;
      case ButtonStyleType.outlined:
        primaryColor = Colors.white;
        textColor = baseColor;
        borderSide = BorderSide(color: baseColor, width: 2.0);
        break;
      case ButtonStyleType.transparent:
      default:
        primaryColor = Colors.transparent;
        textColor = baseColor;
        borderSide = BorderSide.none;
        break;
    }

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        side: MaterialStateProperty.all(borderSide),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: buttonSize ?? 20.0, vertical: 10.0)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (purpose != ButtonPurpose.none)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _iconForPurpose(purpose),
            ),
          Text(buttonText, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
