import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';
import 'package:mulki_zerin/src/widgets/card/take_image.dart';
import 'package:mulki_zerin/src/widgets/card/text_form.dart';

class AddNewProperty extends StatefulWidget {
  @override
  _AddNewPropertyState createState() => _AddNewPropertyState();
}

class _AddNewPropertyState extends State<AddNewProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Add New Property",style: TextStyle(color: AppColors.darkPrimaryColor),),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TakeImage(),
                TextForm(Icons.add_location_alt_outlined,"شوین"),
                SizedBox(height: 12),
                TextForm(Icons.merge_type,"جوری مولک"),
                SizedBox(height: 12),
                Container(
                  height: 68,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextForm(Icons.code,"کود"),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextForm(Icons.money,"نرخ"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 68,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextForm(Icons.open_with,"روبه ر "),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextForm(Icons.date_range,"به رواری تومار"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                TextForm(Icons.text_snippet,"پیناسه"),
                SizedBox(height: 12),
                TextForm(Icons.phone,"ژماره موبایلی نوسینگه"),
                SizedBox(height: 12),
                TextForm(Icons.mobile_friendly,"ژماره موبایلی خاونی"),
                SizedBox(height: 12),
                TextForm(Icons.camera_enhance_rounded,"تیبینی زیاتر"),
                SizedBox(height: 12),
                SizedBox(height: 12),
                PrimaryButton(child: Text("زیادکردن"),
                    onPressed: (){}),
                SizedBox(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
