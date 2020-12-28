import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mulki_zerin/core/app_colors.dart';

class HouseItemImageWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  HouseItemImageWidget({this.imageUrl, this.size = 120.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,

      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(AppColors.errorColor, BlendMode.colorBurn),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error , color: AppColors.errorColor,),
      ),
    );
  }
}
