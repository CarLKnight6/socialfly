import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final TextEditingController? controller;
  final double fontSize;
  final String label;
  final double horizontalPadding;
  final double? verticalPadding;
  final double borderRadius;
  final double? height;
  final Color? borderColor;
  bool isObscure;
  final bool isPassword;
  final String? hintText;
  CustomTextFormField({
    super.key,
    this.controller,
    this.verticalPadding,
    required this.fontSize,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.label,
    this.isObscure = true,
    this.isPassword = false,
    this.onChanged,
    this.onValidate,
    this.hintText = '',
    this.height,
    this.borderColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? widget.isObscure : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.onValidate ??
          (value) {
            if (value!.isEmpty) return '';
            return null;
          },
      style: TextStyle(
        fontFamily: 'Raleway',
        fontSize: widget.fontSize,
        height: widget.height ?? 1,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
        labelStyle: TextStyle(
          fontFamily: 'Raleway',
          fontSize: widget.fontSize,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Raleway',
          color: Colors.grey,
        ),
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? 0,
          horizontal: widget.horizontalPadding,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    widget.isObscure = widget.isObscure ? false : true;
                  });
                },
              )
            : null,
      ),
    );
  }
}
