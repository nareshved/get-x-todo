import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  const MyTextFields({super.key, required this.todoController});

  final TextEditingController todoController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: todoController,
      keyboardType: TextInputType.text,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
