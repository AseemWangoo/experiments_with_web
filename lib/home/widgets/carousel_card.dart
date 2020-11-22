import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/image_loader.dart';

import 'package:flutter/material.dart';

import 'link_content.dart';

const _carouselItemMargin = 8.0;

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    Key key,
    this.medium = BrandLinks.medium,
    this.website = BrandLinks.website,
    this.youtubeLink = BrandLinks.youtube,
    this.asset,
    this.title = '',
    this.subTitle = '',
  }) : super(key: key);

  final String medium;
  final String website;
  final String youtubeLink;

  final ImageProvider asset;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    //
    final titleStyle =
        Theme.of(context).textTheme.caption.apply(color: Colors.black);

    final subTitleStyle =
        Theme.of(context).textTheme.overline.apply(color: Colors.black);

    return Container(
      margin: EdgeInsets.all(_carouselItemMargin),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (asset != null) ImageWidgetPlaceholder(image: asset),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: titleStyle,
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    subTitle,
                    style: subTitleStyle,
                    maxLines: 5,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 150,
              child: Container(
                color: Colors.grey.withOpacity(0.6),
                child: CustomLinkContent(
                  medium: medium,
                  website: website,
                  youtubeLink: youtubeLink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
