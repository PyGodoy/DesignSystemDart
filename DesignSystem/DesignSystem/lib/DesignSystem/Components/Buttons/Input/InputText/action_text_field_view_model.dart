import 'package:flutter/material.dart';

// Enum para os estados do campo de texto
enum TextFieldState {
  enabled,
  disabled,
  error,
}

// Classe ViewModel para o campo de texto
class ActionTextFieldViewModel {
  final TextFieldState state;
  final String hintText;
  final String? errorText;
  final Image? icon;
  final String? Function(String)? validator;

  ActionTextFieldViewModel({
    required this.state,
    required this.hintText,
    this.errorText,
    this.icon,
    this.validator,
  });
}
