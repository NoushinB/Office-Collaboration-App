import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/src/widgets/card/text_field_search.dart';
import 'package:mulki_zerin/src/widgets/house_item_widget.dart';

class SearchFragment extends StatefulWidget {
  @override
  _SearchFragmentState createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:  Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 24,),
                TextFieldSearch(),
              SizedBox(height: 16,),
              HouseItemWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
