import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mulki_zerin/core/app_asstes.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/bloc/blocs/property/create_property_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/property_event.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/enums/enums.dart';
import 'package:mulki_zerin/src/models/activity_result_model.dart';
import 'package:mulki_zerin/src/models/property/create_property_model.dart';
import 'package:mulki_zerin/src/models/select_list_item_model.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:mulki_zerin/src/pages/category/categories_list_page.dart';
import 'package:mulki_zerin/src/pages/place/places_list_page.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';
import 'package:mulki_zerin/src/widgets/card/text_form_input.dart';
import 'package:mulki_zerin/src/widgets/card/text_form_input_selector.dart';
import 'package:mulki_zerin/src/widgets/confirm_bottom_sheet_dialog.dart';
import 'package:permission/permission.dart';

class AddNewProperty extends StatefulWidget {
  @override
  _AddNewPropertyState createState() => _AddNewPropertyState();
}

class _AddNewPropertyState extends State<AddNewProperty> {
  final _profileFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  CreatePropertyBloc _createPropertyBloc;
  LocalStorageService _storageService;
  UserProfileDataModel currentUser;
  File _file;
  bool _isBusy = false;

  SelectListItemModel _selectedPlace;
  SelectListItemModel _selectedCategory;
  TextEditingController _txtPriceEditingController;
  TextEditingController _txtCodeEditingController;
  TextEditingController _txtAreaEditingController;
  TextEditingController _txtSpecificationsEditingController;
  TextEditingController _txtRealEstatePhoneEditingController;
  TextEditingController _txtPhoneEditingController;
  TextEditingController _txtDescriptionEditingController;

  @override
  void initState() {
    _createPropertyBloc = getIt.get<CreatePropertyBloc>();
    super.initState();
    _isBusy = false;
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add New Property",
          style: TextStyle(color: AppColors.darkPrimaryColor),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                new Container(
                  height: 160.0,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: new Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 120.0,
                                height: 120.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: _file != null ? Image.file(_file, fit: BoxFit.fill) : Image.asset(AppAssets.placeHolder),
                                ),
                              ),
                            ),
                            !_isBusy
                                ? Padding(
                                    padding: EdgeInsets.only(top: 90.0, right: 0.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        InkWell(
                                          child: new CircleAvatar(
                                            backgroundColor: Theme.of(context).accentColor,
                                            radius: 25.0,
                                            child: new Icon(Icons.camera_alt, color: Colors.white),
                                          ),
                                          onTap: () async {
                                            if (!_isBusy) {
                                              if (Platform.isAndroid) {
                                                var permissions = List<PermissionName>();
                                                permissions.add(PermissionName.Storage);
                                                var results = await Permission.getPermissionsStatus(permissions);
                                                var storageStatus = results[0].permissionStatus;
                                                if (storageStatus == PermissionStatus.allow) {
                                                  _avatarOptionsMenu();
                                                } else {
                                                  var result = await Permission.requestPermissions(permissions);
                                                  if (result[0].permissionStatus == PermissionStatus.allow) {
                                                    _avatarOptionsMenu();
                                                  }
                                                }
                                              } else {
                                                _avatarOptionsMenu();
                                              }
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormInputSelector(
                  icon: Icons.add_location_alt_outlined,
                  label: "Place",
                  value: _selectedPlace != null ? _selectedPlace.title : "...",
                  callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlacesListPage())).then((result) {
                      if (result is ActivityResultModel && result.result == ActivityResult.RESULT_OK) {
                        var placeResult = result.data as SelectListItemModel;
                        setState(() {
                          _selectedPlace = placeResult;
                        });
                      }
                    });
                  },
                ),
                SizedBox(height: 12),
                TextFormInputSelector(
                  icon: Icons.list,
                  label: "Category",
                  value: _selectedCategory != null ? _selectedCategory.title : "...",
                  callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesListPage())).then((result) {
                      if (result is ActivityResultModel && result.result == ActivityResult.RESULT_OK) {
                        var placeResult = result.data as SelectListItemModel;
                        setState(() {
                          _selectedCategory = placeResult;
                        });
                      }
                    });
                  },
                ),
                SizedBox(height: 12),
                Container(
                  height: 68,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormInput(
                          controller: _txtAreaEditingController,
                          icon: Icons.open_with,
                          label: "Area",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormInput(
                          icon: Icons.money,
                          label: "Price",
                          controller: _txtPriceEditingController,
                          inputType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                TextFormInput(
                  icon: Icons.text_snippet_outlined,
                  label: "Specifications",
                ),
                SizedBox(height: 12),
                TextFormInput(
                  icon: Icons.phone_outlined,
                  label: "Real-Estate Phone",
                ),
                SizedBox(height: 12),
                TextFormInput(icon: Icons.mobile_friendly, label: "Owner Phone"),
                SizedBox(height: 12),
                TextFormInput(
                  icon: Icons.note_outlined,
                  label: "Description",
                  lines: 5,
                ),
                SizedBox(height: 12),
                SizedBox(height: 12),
                PrimaryButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white))],
                    ),
                    onPressed: () {
                      var files = new List<File>();
                      if (_file != null) {
                        files.add(_file);
                      }
                      var model = new CreatePropertyModel(
                        placeId: _selectedPlace.id,
                        categoryId: _selectedCategory.id,
                        area: 200,
                        description: "This is description",
                        phone: "7505248743",
                        price: 30000,
                        realEstateName: "RealEstate",
                        realEstatePhone: "7505248743",
                        specifications: "Good Home For Sale",
                        title: "Home in Park View",
                        x_Long: "",
                        y_Lat: "",
                      );
                      _createPropertyBloc.add(CreateNewProperty(_storageService.accessToken, model, files));
                    }),
                SizedBox(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _createPropertyBloc.close();
    super.dispose();
  }

  _avatarOptionsMenu() {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 8),
                    child: Text("Choose Photo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library, size: 26),
                    title: Text("Select From Gallery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    onTap: () async {
                      Navigator.pop(context);
                      _pickOrTakePhoto(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera, size: 26),
                    title: Text("Take Photo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    onTap: () {
                      Navigator.pop(context);
                      _pickOrTakePhoto(ImageSource.camera);
                    },
                  ),
                  _file != null
                      ? ListTile(
                          leading: Icon(Icons.delete, size: 26, color: Colors.red),
                          title: Text("Remove Photo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red)),
                          onTap: () {
                            Navigator.pop(context);
                            _confirmBottomSheetDialog(
                              "Are you sure?",
                              "Remove",
                              "Cancel",
                              () {
                                Navigator.pop(context);
                                setState(() {
                                  _file = null;
                                });
                              },
                            );
                          },
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickOrTakePhoto(ImageSource fromSource) async {
    var image = await ImagePicker().getImage(source: fromSource);
    setState(() {
      _file = File(image.path);
    });
  }

  _confirmBottomSheetDialog(String title, String okTitle, String dismissTitle, VoidCallback callBack) {
    var bottomSheetController = showModalBottomSheet(
      context: context,
      elevation: 10,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      builder: (builder) {
        return ConfirmBottomSheetDialog(
          textTitle: title,
          okText: okTitle,
          cancelText: dismissTitle,
          onOkTap: () => callBack(),
          onCancelTap: () => Navigator.pop(context),
        );
      },
    );

    bottomSheetController.whenComplete(() {
      Future.delayed(new Duration(milliseconds: 500));
    });
  }

  void showInSnackBar(String value, Color backgroundColor) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
    ));
  }
}
