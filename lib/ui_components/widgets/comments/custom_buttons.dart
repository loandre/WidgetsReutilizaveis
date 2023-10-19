import 'package:flutter/material.dart';

// Enumerações para definir o estilo, cor e propósito do botão.
enum ButtonStyleType { filled, outlined, transparent }

enum ButtonColor { primary, secondary }

enum ButtonPurpose {
  add,
  none,
  add_alarm_rounded,
  add_photo_alternate,
  image // Para o uso de imagens
}

class CustomButton extends StatelessWidget {
  // Propriedades do botão personalizado
  final ButtonStyleType
      styleType; // Define o estilo visual do botão (preenchido, contorno, transparente)
  final ButtonColor
      buttonColor; // Define a cor principal do botão (primária ou secundária)
  final ButtonPurpose
      purpose; // Define o propósito do botão e o ícone correspondente
  final VoidCallback?
      onPressed; // Ação a ser executada quando o botão é pressionado
  final double? borderRadius; // Raio da borda arredondada do botão
  final double? buttonSize; // Tamanho horizontal do botão
  final String? imagePath; // Path para a imagem, se usar ButtonPurpose.image
  final String buttonText; // Texto a ser mostrado no botão

  CustomButton({
    Key? key,
    required this.styleType,
    required this.buttonText, // necessário para cada botão
    this.buttonColor = ButtonColor.primary,
    this.purpose = ButtonPurpose.none,
    this.onPressed,
    this.borderRadius,
    this.buttonSize,
    this.imagePath, // parâmetro para a imagem
  }) : super(key: key);

  // Retorna o ícone apropriado com base no propósito definido
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

  // Retorna a cor do ícone com base no estilo e cor do botão
  Color _iconColor() {
    if (styleType == ButtonStyleType.filled) {
      if (buttonColor == ButtonColor.primary) {
        return Colors.white; // Branco para botão azul
      } else {
        return Colors.white70; // Grey mais claro para botão cinza
      }
    }
    return buttonColor == ButtonColor.primary ? Colors.blue : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    // Cores e estilo baseados nas propriedades definidas
    Color primaryColor;
    Color textColor;
    BorderSide borderSide;

    Color baseColor =
        buttonColor == ButtonColor.primary ? Colors.blue : Colors.grey;

    switch (styleType) {
      case ButtonStyleType.filled:
        primaryColor = baseColor;
        textColor =
            buttonColor == ButtonColor.primary ? Colors.white : Colors.white70;
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

    // Construção do botão personalizado
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
          Text(buttonText,
              style: TextStyle(color: textColor)), // use buttonText aqui
        ],
      ),
    );
  }
}
