import 'package:flutter/material.dart';

enum ButtonStyleType { filled, outlined, transparent }

enum ButtonVariant { primary, secondary }

enum ButtonAssets { add, none, add_photo_alternate, image }

class CustomButton extends StatelessWidget {
  final ButtonStyleType styleType;
  final ButtonVariant buttonColor;
  final ButtonAssets asset;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final double? buttonSize;
  final String? imagePath;
  final String buttonText;

  const CustomButton({
    Key? key,
    required this.styleType,
    required this.buttonText,
    this.buttonColor = ButtonVariant.primary,
    this.asset = ButtonAssets.none,
    this.onPressed,
    this.borderRadius,
    this.buttonSize,
    this.imagePath,
  }) : super(key: key);

  Widget _iconForAssets(ButtonAssets asset) {
    switch (asset) {
      case ButtonAssets.add:
        return Icon(Icons.add, color: _iconColor());
      case ButtonAssets.add_photo_alternate:
        return Icon(Icons.add_photo_alternate, color: _iconColor());
      case ButtonAssets.image:
        if (imagePath != null) {
          return Image.asset(imagePath!, width: 24, height: 24);
        } else {
          return const Icon(Icons.clear);
        }
      case ButtonAssets.none:
      default:
        return const Icon(Icons.clear);
    }
  }

  Color _iconColor() {
    if (styleType == ButtonStyleType.filled) {
      if (buttonColor == ButtonVariant.primary) {
        return Colors.white;
      } else {
        return Colors.white70;
      }
    }
    return buttonColor == ButtonVariant.primary ? const Color(0xFF0e76ad) : const Color(0xFF909ca3);
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    Color textColor;
    BorderSide borderSide;

    Color baseColor =
        buttonColor == ButtonVariant.primary ? const Color(0xFF0e76ad) : const Color(0xFF909ca3);

    switch (styleType) {
      case ButtonStyleType.filled:
        primaryColor = baseColor;
        textColor =
            buttonColor == ButtonVariant.primary ? Colors.white : Colors.white70;
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
          if (asset != ButtonAssets.none)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _iconForAssets(asset),
            ),
          Text(buttonText, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
