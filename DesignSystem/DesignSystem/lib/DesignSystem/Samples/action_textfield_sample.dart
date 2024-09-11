import 'package:flutter/material.dart';
import '../Components/Buttons/Input/InputText/action_text_field_view_model.dart';
import '../Components/Buttons/Input/InputText/action_text_field.dart';

class ActionTextFieldSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input TextField Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Habilitada com ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.enabled,
                hintText: 'Enabled with Icon',
                icon: Image.asset(
                    'assets/icons/email.png'), // Ajuste o caminho do ícone
                validator: (value) =>
                    null, // Nenhuma validação para campos habilitados
              ),
            ),
            SizedBox(height: 16.0),

            // Habilitada sem ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.enabled,
                hintText: 'Enabled without Icon',
                validator: (value) =>
                    null, // Nenhuma validação para campos habilitados
              ),
            ),
            SizedBox(height: 16.0),

            // Desabilitada com ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.disabled,
                hintText: 'Disabled with Icon',
                icon: Image.asset(
                    'assets/icons/lock.png'), // Ajuste o caminho do ícone
                validator: (value) =>
                    null, // Nenhuma validação para campos desabilitados
              ),
            ),
            SizedBox(height: 16.0),

            // Desabilitada sem ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.disabled,
                hintText: 'Disabled without Icon',
                validator: (value) =>
                    null, // Nenhuma validação para campos desabilitados
              ),
            ),
            SizedBox(height: 16.0),

            // Erro com ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.error,
                hintText: 'Error with Icon',
                icon: Image.asset(
                    'assets/icons/error.png'), // Ajuste o caminho do ícone
                validator: (value) {
                  final number = double.tryParse(value);
                  if (number != null && number > 10000) {
                    return 'Value exceeds 10,000';
                  }
                  return null; // No error
                },
              ),
            ),
            SizedBox(height: 16.0),

            // Erro sem ícone
            ActionTextField.instantiate(
              viewModel: ActionTextFieldViewModel(
                state: TextFieldState.error,
                hintText: 'Error without Icon',
                validator: (value) {
                  final number = double.tryParse(value);
                  if (number != null && number > 10000) {
                    return 'Value exceeds 10,000';
                  }
                  return null; // No error
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
