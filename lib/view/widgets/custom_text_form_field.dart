import 'package:flutter/material.dart';

const color = Color(0xffFF6F02);

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.icon,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData icon;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final border = OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.black,
      width: 3,
    ),
  );

  final errorBorder = OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.red,
      width: 3,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: widget.isPassword,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.keyboardType,
            onChanged: (_) => setState(() {}),
            cursorColor: Colors.black,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 10.0,
              ),
              border: border,
              disabledBorder: border,
              focusedBorder: border,
              enabledBorder: border,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              suffixIcon: Icon(
                widget.icon,
                color: widget.validator(widget.controller.text) == null
                    ? color
                    : Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: widget.validator(widget.controller.text) == null
              ? const Icon(
                  Icons.check,
                  color: color,
                  size: 28,
                )
              : null,
        ),
      ],
    );
  }
}
