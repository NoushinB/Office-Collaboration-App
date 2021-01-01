import 'package:flutter/material.dart';
import 'package:mulki_zerin/src/models/place/place_list_item_model.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceListItemModel place;
  final VoidCallback callback;

  PlaceItemWidget({@required this.place, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
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
                          Text(place.name ?? "", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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
