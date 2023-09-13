import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    required this.controller,
    required this.value,
    required this.icon
  });

  final TextEditingController controller;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (String? value){
        if(value!.isEmpty){
          return '${this.value} must not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: value,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}