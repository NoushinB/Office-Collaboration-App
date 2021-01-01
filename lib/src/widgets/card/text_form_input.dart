import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TextFormInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool isRequired;
  final int lines;
  final int maxLength;

  TextFormInput({
    this.icon,
    this.label,
    this.inputType = TextInputType.text,
    @required this.controller,
    this.isRequired = false,
    this.lines = 1,
    this.maxLength = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: AppColors.lightPrimaryColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: AppColors.lightPrimaryColor, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            controller: controller,
            initialValue: '',
            keyboardType: inputType,
            maxLines: lines,
            minLines: lines,
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: "",
              focusColor: AppColors.lightPrimaryColor,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              icon: Icon(icon, color: AppColors.darkPrimaryColor),
              labelText: label,
              labelStyle: TextStyle(color: AppColors.darkPrimaryColor, fontWeight: FontWeight.bold),
            ),
            validator: (value) {
              if (isRequired && value == null) {
                return "This field is required";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
