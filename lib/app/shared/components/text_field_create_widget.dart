import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCreate extends StatelessWidget {
  final dynamic inputFormatters;
  final Icon icon;
  final String labelText;
  final String hintText;
  final dynamic maxLength;
  final TextInputType keyboardType;
  final dynamic onChanged;
  final dynamic errorText;
  final dynamic maxLines;

  const TextFieldCreate(
      {Key? key,
      this.inputFormatters,
      required this.icon,
      required this.labelText,
      required this.hintText,
      this.maxLength,
      required this.keyboardType,
      this.onChanged,
      this.errorText,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters:
          inputFormatters ?? [LengthLimitingTextInputFormatter(maxLength)],
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hoverColor: Colors.red,
        icon: icon,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      onChanged: onChanged,
    );
  }
}
