import 'package:flutter/material.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';
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
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(height: 12),
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
                TakeImage(),
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
