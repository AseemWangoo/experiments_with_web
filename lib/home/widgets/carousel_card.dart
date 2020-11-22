import 'package:flutter/material.dart';

const _carouselItemMargin = 8.0;

class CarouselCard extends StatelessWidget {
  const CarouselCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: EdgeInsets.all(_carouselItemMargin),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
              child: Text('Hello'),
            ),
          ],
        ),
      ),
    );
  }
}
