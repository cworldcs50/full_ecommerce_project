import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    this.obsecureText = false,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final String hintText;
  final String labelText;
  final bool obsecureText;
  final TextInputType keyboardType;
  final void Function()? onPressed;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Text(labelText),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        suffixIcon: IconButton(onPressed: onPressed, icon: Icon(icon)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}