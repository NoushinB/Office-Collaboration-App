

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/bloc/blocs/login/login_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/login_event.dart';
import 'package:mulki_zerin/src/bloc/states/login/login_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/enums/enums.dart';
import 'package:mulki_zerin/src/pages/home/home_page.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';
import 'package:mulki_zerin/src/widgets/button/primary_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _loginFormKey = GlobalKey<FormState>();

  var _txtUserNameController = TextEditingController();
  var _txtPasswordController = TextEditingController();

  var _netState = NetState.UNINITIALIZED;

  LoginBloc _loginBloc;
  LocalStorageService _storageService;

  @override
  void initState() {
    _loginBloc = getIt<LoginBloc>();
    super.initState();
    _fetchInitData();
  }

  _fetchInitData() async {
    try {
      _storageService = await LocalStorageService.getInstance();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: BlocListener(
          bloc: _loginBloc,
          listener: (BuildContext context, LoginState state) {
            if(state is LoginSuccess){
              _storageService.accessToken = state.result.accessToken;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            }
          },
          child: Form(
              key: _loginFormKey,
              child: BlocBuilder(
                bloc: _loginBloc,
                builder: (BuildContext context, LoginState state){
                  return Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text("Login",
                            style:
                            TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                        SizedBox(height: 90),
                        Container(
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextFormField(
                                    controller: _txtUserNameController,
                                    enabled: !(state is LoginLoading),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      icon: Icon(Icons.person_outline_outlined),
                                      labelText: 'UserName/Email',
                                    ),
                                    validator: (value) {
                                      if(value.isEmpty){
                                        return "Username is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Divider(thickness: 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: TextFormField(
                                    controller: _txtPasswordController,
                                    enabled: !(state is LoginLoading),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      icon: Icon(Icons.lock_outline),
                                      labelText: 'Password',
                                    ),
                                    validator: (value) {
                                      if(value.isEmpty){
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: PrimaryButton(
                            text: state is LoginLoading ? "Please Wait" : "Login",
                            onPressed: () {
                              if (_loginFormKey.currentState.validate()) {
                                var username = _txtUserNameController.text;
                                var password = _txtPasswordController.text;
                                _loginBloc.add(Login(username, password));
                              } else {
                                setState(() {
                                  _netState = NetState.UNINITIALIZED;
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "Don’t have an account?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18, height: 1.5),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Create a new account',
                                        style: TextStyle(
                                            color: AppColors.darkPrimaryColor,
                                            fontSize: 18))
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
          ),
        ),
      ),
    );
  }
}
