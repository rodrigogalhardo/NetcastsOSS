import 'dart:math';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class WithFadeInImage extends StatelessWidget {
  final List<String> availablePlaceholders = [
   'images/01--default-fadein-image.jpg',
   'images/02--default-fadein-image.jpg',
   'images/03--default-fadein-image.jpg',
   'images/04--default-fadein-image.jpg',
   'images/05--default-fadein-image.jpg',
   'images/06--default-fadein-image.jpg',
   'images/07--default-fadein-image.jpg',
   'images/08--default-fadein-image.jpg',
  ];
  final Random rng = new Random();

  String heroTag;
  String location;

  WithFadeInImage({
    Key key,
    this.location,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int randIdx = rng.nextInt(availablePlaceholders.length);
    String randomPlaceholder = availablePlaceholders[randIdx];

    Widget image = location != null
      ? DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: CachedNetworkImageProvider(location),
          ),
        ),
      )
      : DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(randomPlaceholder),
            fit: BoxFit.fill,
          ),
        ),
      )
    ;

    return heroTag != null
      ? Hero(
        tag: heroTag,
        child: image,
      )
      : image
    ;
  }
}
