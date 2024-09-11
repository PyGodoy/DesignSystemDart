import 'package:flutter/material.dart';
import 'action_text_field_view_model.dart';

class ActionTextField extends StatefulWidget {
  final ActionTextFieldViewModel viewModel;

  const ActionTextField._(this.viewModel);

  static Widget instantiate({required ActionTextFieldViewModel viewModel}) {
    return ActionTextField._(viewModel);
  }

  @override
  _ActionTextFieldState createState() => _ActionTextFieldState();
}

class _ActionTextFieldState extends State<ActionTextField> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_validateInput);
    _controller.dispose();
    super.dispose();
  }

  void _validateInput() {
    if (widget.viewModel.validator != null) {
      final error = widget.viewModel.validator!(_controller.text);
      setState(() {
        _errorText = error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color textColor;
    Color hintColor;

    // Define colors based on error state
    if (_errorText != null) {
      borderColor = Colors.red;
      textColor = Colors.black;
      hintColor = Colors.red;
    } else {
      borderColor = Colors.black; // Default border color
      textColor = Colors.black;
      hintColor = Colors.grey; // Default hint color
    }

    return TextField(
      controller: _controller,
      enabled: widget.viewModel.state != TextFieldState.disabled,
      decoration: InputDecoration(
        hintText: widget.viewModel.hintText,
        hintStyle: TextStyle(color: hintColor),
        errorText: _errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: widget.viewModel.icon != null
            ? Container(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 24.0, // Ajuste o tamanho conforme necessário
                  height: 24.0, // Ajuste o tamanho conforme necessário
                  child: widget.viewModel.icon,
                ),
              )
            : null,
      ),
      style: TextStyle(color: textColor),
    );
  }
}
