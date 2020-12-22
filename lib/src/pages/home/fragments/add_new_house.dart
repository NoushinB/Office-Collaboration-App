import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/widgets/card/take_image.dart';
import 'package:mulki_zerin/src/widgets/card/text_form.dart';


class AddNewHouse extends StatefulWidget {
  @override
  _AddNewHouseState createState() => _AddNewHouseState();
}

class _AddNewHouseState extends State<AddNewHouse> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TakeImage(),
              SizedBox(height: 40),
              TextForm(Icons.segment),
              SizedBox(height: 12),
              TextForm(Icons.search),
              SizedBox(height: 12),
              TextForm(Icons.camera_enhance_rounded),
              SizedBox(height: 12),
              TextForm(Icons.camera_enhance_rounded),
              SizedBox(height: 12),
              Container(
                height: 78,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextForm(Icons.camera_enhance_rounded),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextForm(Icons.camera_enhance_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              TextForm(Icons.camera_enhance_rounded),
              SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
