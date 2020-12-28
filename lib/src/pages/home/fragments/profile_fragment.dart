import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class ProfileFragment extends StatefulWidget {
  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 60),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Card(
                                color: AppColors.primaryColor,
                                child: Icon(Icons.person,
                                    size: 70,
                                    color: AppColors.darkPrimaryColor)),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "farzad dawood amin",
                            style: TextStyle(
                                fontSize: 21,
                                color: AppColors.darkPrimaryColor),
                          ),
                        ],
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    )
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ListTile(
                          title: Text('کارمه ندی ئونلاین',
                              style: TextStyle(
                                  fontSize: 21,
                                  color: AppColors.darkPrimaryColor)),
                        ),
                        Divider(
                            height: 1,
                            thickness: 2,
                            color: AppColors.darkPrimaryColor),
                        ListTile(
                          title: Row(
                            children: [

                              Text('شاری نیشته جی بون',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: AppColors.darkPrimaryColor)),
                            ],
                          ),
                        ),
                        Divider(
                            height: 1,
                            thickness: 2,
                            color: AppColors.darkPrimaryColor),
                        ListTile(
                          title: Text('',
                              style: TextStyle(
                                  fontSize: 21,
                                  color: AppColors.darkPrimaryColor)),
                        ),
                        Divider(
                            height: 1,
                            thickness: 2,
                            color: AppColors.darkPrimaryColor),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ],
        ));
  }
}
