import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    Key key,
    @required this.image,
    this.width,
    this.fit = BoxFit.cover,
    this.height,
  }) : super(key: key);

  final ImageProvider image;
  final double height;

  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    //

    return Image(
      image: image,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
        );
      },
      fit: fit,
      height: height,
      width: width,
    );
  }
}
