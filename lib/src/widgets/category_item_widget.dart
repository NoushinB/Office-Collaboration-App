import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';
import 'package:mulki_zerin/src/models/category/category_list_item_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryListItemModel category;
  final VoidCallback callback;

  CategoryItemWidget({@required this.category, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            offset: Offset(0, 5),
            blurRadius: 6,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        elevation: 0,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(category.name ?? "", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.darkPrimaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: (){
            callback();
          },
        ),
      ),
    );
  }
}
