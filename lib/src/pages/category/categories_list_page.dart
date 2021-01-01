import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mulki_zerin/src/bloc/blocs/category/categories_list_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/category_event.dart';
import 'package:mulki_zerin/src/bloc/states/category/categories_list_state.dart';
import 'package:mulki_zerin/src/bloc/states/place/places_list_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/enums/enums.dart';
import 'package:mulki_zerin/src/models/activity_result_model.dart';
import 'package:mulki_zerin/src/models/select_list_item_model.dart';
import 'package:mulki_zerin/src/widgets/category_item_widget.dart';
import 'package:mulki_zerin/src/widgets/exception_view.dart';
import 'package:mulki_zerin/src/widgets/network_sensetive.dart';
import 'package:mulki_zerin/src/widgets/no_item_found.dart';

class CategoriesListPage extends StatefulWidget {
  @override
  _CategoriesListPageState createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> with TickerProviderStateMixin {
  Key key = UniqueKey();

  final _scrollController = ScrollController();

  final _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  CategoriesListBloc _categoriesListBloc;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _categoriesListBloc = getIt.get<CategoriesListBloc>();
    super.initState();
    _fetchInitData();
  }

  _fetchInitData() async {
    try {
      _categoriesListBloc.add(FetchCategoriesList());
    } catch (e) {
      Fluttertoast.showToast(msg: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        key: key,
        padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: NetworkSensitive(
            child: BlocBuilder(
              bloc: _categoriesListBloc,
              builder: (BuildContext context, CategoriesListState state) {
                if (state is PlacesListUninitialized ) {
                  return Center(
                    child: SpinKitThreeBounce(size: 32, color: Theme.of(context).accentColor),
                  );
                }
                if (state is CategoriesListError) {
                  return ExceptionView(state.exception);
                }
                if (state is CategoriesListLoaded) {
                  if (state.result.isEmpty) {
                    return NoItemFound(
                      assetImage: 'assets/images/empty-list.png',
                      title: "No places found",
                      showActionButton: false,
                      imageSize: 200.0,
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var category = state.result[index];
                      var count = state.result.length;
                      var animation = Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                        ),
                      );
                      _animationController.forward();
                      return AnimatedBuilder(
                        animation: _animationController,
                        builder: (BuildContext context, Widget child) {
                          return FadeTransition(
                            opacity: animation,
                            child: new Transform(
                              transform: new Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
                              child: CategoryItemWidget(
                                category: category,
                                callback: () {
                                  if(Navigator.canPop(context)){
                                    var selectedItem = SelectListItemModel(category.id, category.name);
                                    var result = ActivityResultModel(ActivityResult.RESULT_OK, selectedItem);
                                    Navigator.of(context).pop(result);
                                  }
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: state.result.length,
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
    _categoriesListBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  Future<Null> _refresh() {
    Completer<Null> completer = new Completer<Null>();
    Timer(new Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
}
