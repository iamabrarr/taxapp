import 'package:flutter/services.dart';

class CustomFormatter {
  static TextInputFormatter getFormatter(String formatPattern) {
    return _CustomTextInputFormatter(formatPattern);
  }
}

class _CustomTextInputFormatter extends TextInputFormatter {
  final String _formatPattern;

  _CustomTextInputFormatter(this._formatPattern);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formatted = _formatInput(newValue.text);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatInput(String input) {
    final StringBuffer formatted = StringBuffer();
    int inputIndex = 0;

    for (int i = 0; i < _formatPattern.length; i++) {
      if (inputIndex >= input.length) {
        break;
      }

      final formatChar = _formatPattern[i];

      if (formatChar == 'x') {
        formatted.write(input[inputIndex]);
        inputIndex++;
      } else {
        formatted.write(formatChar);
      }
    }

    return formatted.toString();
  }
}
