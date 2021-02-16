import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_asstes.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:mulki_zerin/src/pages/home/profile_settings.dart';
import 'package:mulki_zerin/src/pages/home/property_list.dart';
import 'package:mulki_zerin/src/pages/home/search_page.dart';
import 'package:mulki_zerin/src/pages/map/map_sample.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';
import 'package:mulki_zerin/src/widgets/button/search_button.dart';
import 'package:mulki_zerin/src/widgets/button/secondary_button.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildTile(
                        color: AppColors.lightPrimaryColor,
                        icon: Icons.favorite,
                        title: "All",
                        data: "864",
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildTile(
                        color: AppColors.primaryColor,
                        icon: Icons.add,
                        title: "Creat You",
                        data: "857",
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildTile(
                        color: AppColors.lightPrimaryColor,
                        icon: Icons.favorite,
                        title: "Arrived Creat You",
                        data: "698",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: Text("Add New Property", style: TextStyle( fontSize: 18.0, color: Colors.white)),
                        ),
                        Icon(Icons.add, size: 32, color: Colors.white),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProperty()));
                    }),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SecondaryButton(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(child: Text("My Properties", style: TextStyle( fontSize: 18.0,color: AppColors.darkPrimaryColor))),
                        Icon(Icons.arrow_forward_ios, size: 28,color: AppColors.darkPrimaryColor,), ],
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyPropertyList()));
                    }),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SearchButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MapSample()));
                        },
                        color: AppColors.lightPrimaryColor,
                      icon: Icons.map,
                        title: "Map",

                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: SearchButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                        },
                        color: AppColors.primaryColor,
                        icon: Icons.search,
                        title: "Search",

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        )),
        SizedBox(height: 16,),
        SizedBox(width: 100, height: 60, child: Image.asset(AppAssets.appLogo)),
        Text(
          "Mulki Zerin",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: AppColors.darkPrimaryColor),
        )
      ],
    );
  }

  Container _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: AppColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: AppColors.darkPrimaryColor),
            ),
            trailing: InkWell(
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(currentUser != null ? currentUser.avatarUrl : ""),
                backgroundColor: AppColors.darkPrimaryColor,
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
              currentUser != null ? currentUser.fullName : "Guest",
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
        borderRadius: BorderRadius.circular(6.0),
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

