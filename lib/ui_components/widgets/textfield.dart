import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String supportingText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool showLabel;

  CustomTextField({
    Key? key,
    required this.labelText,
    required this.supportingText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.showLabel = true,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(widget.labelText, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            filled: true,
            fillColor: Colors.white,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            errorStyle: TextStyle(color: Colors.red),
            hintText: 'Text',
          ),
          validator: (value) {
            final validationResult = widget.validator?.call(value ?? "");
            setState(() {
              _hasError = validationResult != null;
            });
            return validationResult;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            widget.supportingText,
            style: TextStyle(
              color: _hasError ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}