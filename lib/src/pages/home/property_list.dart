import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/bloc/blocs/property/property_list_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/property_event.dart';
import 'package:mulki_zerin/src/bloc/states/property/property_list_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/property/property_filter_model.dart';
import 'package:mulki_zerin/src/pages/filter/filter_page.dart';
import 'package:mulki_zerin/src/utils/local_storage_service.dart';
import 'package:mulki_zerin/src/widgets/bottom_loader.dart';
import 'package:mulki_zerin/src/widgets/exception_view.dart';
import 'package:mulki_zerin/src/widgets/network_sensetive.dart';
import 'package:mulki_zerin/src/widgets/no_item_found.dart';
import 'package:mulki_zerin/src/widgets/property_item_widget.dart';

class MyPropertyList extends StatefulWidget {
  final PropertyListState status;

  MyPropertyList({@required this.status});

  @override
  _MyPropertyListState createState() => _MyPropertyListState();
}

class _MyPropertyListState extends State<MyPropertyList>
    with TickerProviderStateMixin {
  Key key = UniqueKey();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  final _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  _MyPropertyListState() {
    _scrollController.addListener(_onScroll);
  }

  LocalStorageService _storageService;
  PropertyListBloc _propertyListBloc;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _propertyListBloc = getIt.get<PropertyListBloc>();
    super.initState();
    _fetchInitData();
  }

  _fetchInitData() async {
    try {
      _storageService = await LocalStorageService.getInstance();
      var accessToken = _storageService.accessToken;
      _propertyListBloc
          .add(FetchPropertiesList(accessToken, PropertyFilterModel()));
    } catch (e) {
      Fluttertoast.showToast(msg: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My Properties",
          style: TextStyle(color: AppColors.darkPrimaryColor),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilterPage()));
              })
        ],
      ),
      body: Container(
        key: key,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: NetworkSensitive(
            child: BlocBuilder(
              bloc: _propertyListBloc,
              builder: (BuildContext context, PropertyListState state) {
                if (state is PropertyListUninitialized) {
                  return Center(
                      child: SpinKitThreeBounce(
                          size: 32, color: Theme.of(context).accentColor));
                }
                if (state is PropertyListError) {
                  return ExceptionView(state.exception);
                }
                if (state is PropertyListLoaded) {
                  if (state.properties.isEmpty) {
                    return NoItemFound(
                      assetImage: 'assets/images/png/placeholder.png',
                      title: "Have Not Place Any Property",
                      showActionButton: false,
                      imageSize: 200.0,
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (index >= state.properties.length) {
                        return BottomLoader(strokeWidth: 1.5);
                      } else {
                        var property = state.properties[index];
                        var count = state.properties.length;
                        var animation = Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn),
                          ),
                        );
                        _animationController.forward();
                        return AnimatedBuilder(
                          animation: _animationController,
                          builder: (BuildContext context, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: new Transform(
                                transform: new Matrix4.translationValues(
                                    0.0, 50 * (1.0 - animation.value), 0.0),
                                child: PropertyItemWidget(property),
                              ),
                            );
                          },
                        );
                      }
                    },
                    itemCount: state.hasReachedMax
                        ? state.properties.length
                        : state.properties.length + 1,
                    controller: _scrollController,
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _propertyListBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _propertyListBloc.add(
        FetchPropertiesList(_storageService.accessToken, PropertyFilterModel()),
      );
    }
  }

  Future<Null> _refresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer(new Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
}
