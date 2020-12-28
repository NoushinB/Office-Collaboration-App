import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'house_item_image_widget.dart';

class HouseItemWidget extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  final String title;
  final String status;
  final String price;

  HouseItemWidget({
    this.imageUrl,
    this.title,
    this.status,
    this.price,
    this.imageSize = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          HouseItemImageWidget(size: imageSize, imageUrl: imageUrl ?? ""),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(status ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey))
              ],
            ),
          ),
          Text(price ?? "",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent))
        ],
      ),
    );
  }
}
