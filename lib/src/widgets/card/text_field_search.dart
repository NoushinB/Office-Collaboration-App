import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class TextFieldSearch extends StatelessWidget {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(primaryColor: AppColors.darkPrimaryColor),
        child: TextField(
          onChanged: (value) {

          },
          controller: editingController,
          decoration: InputDecoration(
              focusColor: AppColors.darkPrimaryColor,

              labelText: "Search",
              labelStyle: TextStyle(color: AppColors.darkPrimaryColor),
              hintText: "Search",
              hintStyle: TextStyle(color: AppColors.darkPrimaryColor),
              prefixIcon: Icon(Icons.search,color: AppColors.darkPrimaryColor,),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
              )),
        ),
      ),
    );
  }
}
