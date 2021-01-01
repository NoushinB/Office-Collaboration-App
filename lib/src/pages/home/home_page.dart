import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:mulki_zerin/src/pages/home/profile_settings.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';

import '../property/add_new_property.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LocalStorageService _storageService;

  UserProfileDataModel currentUser;

  @override
  void initState() {
    super.initState();
    _fetchInitData();
  }

  _fetchInitData() async {
    try {
      _storageService = await LocalStorageService.getInstance();
      setState(() {
        currentUser = _storageService.currentUser;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildTile(
                    color: AppColors.primaryColor,
                    icon: Icons.favorite,
                    title: "Discharged",
                    data: "864",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    color: AppColors.lightPrimaryColor,
                    icon: Icons.portrait,
                    title: "Dropped",
                    data: "857",
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: _buildTile(
                    color: AppColors.primaryColor,
                    icon: Icons.favorite,
                    title: "Arrived",
                    data: "698",
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            PrimaryButton(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 32, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Add New Property",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProperty()));
                }),
          ],
        ),
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: AppColors.lightPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Mulki Zerin",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: AppColors.darkPrimaryColor),
            ),
            trailing: InkWell(
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(currentUser != null ? currentUser.avatarUrl : ""),
                backgroundColor: Colors.transparent,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetting()));
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              currentUser != null ? currentUser.fullName : "",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: AppColors.darkPrimaryColor),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              currentUser != null ? currentUser.userName : "",
              style: TextStyle(color: AppColors.darkPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTile({Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icon, color: AppColors.darkPrimaryColor),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkPrimaryColor),
          ),
          Text(
            data,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: AppColors.darkPrimaryColor),
          ),
        ],
      ),
    );
  }
}
