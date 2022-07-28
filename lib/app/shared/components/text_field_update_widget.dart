import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldUpdate extends StatelessWidget {
  final String initialValue;
  final dynamic maxLength;
  final TextInputType keyboardType;
  final ValueChanged onChanged;
  final dynamic inputFormatters;
  final String errorText;
  final dynamic maxLines;

  const TextFieldUpdate(
      {Key? key,
      required this.initialValue,
      this.maxLength,
      required this.keyboardType,
      required this.onChanged,
      this.inputFormatters,
      required this.errorText,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters == null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: errorText,
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      //Controlador de entada de dado
    );
  }
}
