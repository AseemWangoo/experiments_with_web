import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/codepenz/utilities/constants.dart';
import 'package:experiments_with_web/data_table/utilities/constants.dart';
import 'package:experiments_with_web/game/utilities/constants.dart';
import 'package:experiments_with_web/hooks/utilities/constants.dart';
import 'package:experiments_with_web/iframe/utilities/constants.dart';
import 'package:experiments_with_web/location/utilities/constants.dart';
import 'package:experiments_with_web/ml/utilities/constants.dart';
import 'package:experiments_with_web/nav/utilities/constants.dart';
import 'package:experiments_with_web/parallax/utilities/constants.dart';
import 'package:experiments_with_web/streams/utilities/constants.dart';
import 'package:experiments_with_web/using_selector/utilities/constants.dart';

class ApplevelConstants {
  ApplevelConstants._();

  static const double stdWidth = 1366;
  static const double stdHeight = 768;

  static const String fontFamily = 'Montserrat';

  static const String titleOnTab = 'FlutterWeb | Aseem Wangoo';
  static const String homeTitle = 'Flattered With Flutter';
  static const String supportTitle = '🤗 Support!';

  static const String homeRoute = '/';

  static const String sampleRoute = '/sample';
  static const String googleRoute = '/google-clone';
  static const String iframeRoute = '/iframe';
  static const String parallaxRoute = '/parallax';
  static const String locationRoute = '/location';
  static const String mlRoute = '/ml';
  static const String gameRoute = '/game';
  static const String dtRoute = '/datatable';
  static const String hooksRoute = '/hooks';
  static const String codepenRoute = '/codepens';
  static const String streamsRoute = '/streams';
  static const String selectorsRoute = '/selector';
  static const String visitedPagesRoute = '/pages-seen';

  /* MENU OPTIONS */
  static const String option1 = 'Sample';
  static const String option2 = 'Google';
  static const String option3 = 'Iframe';
  static const String option4 = 'Parallax';
  static const String option5 = 'Location';
  static const String option6 = 'ML';
  static const String option7 = 'Game Time';
  static const String option8 = 'Data Table';
  static const String option9 = 'Hooks';
  static const String option10 = 'Slivers & Codepen';
  static const String option11 = 'Streams & Hooks';
  static const String option12 = 'Selectors in Provider';
  static const String option13 = 'Navigation History';
}

class WHOLinks {
  WHOLinks._();

  static const String message =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public';
}

class BrandLinks {
  BrandLinks._();

  static const String website = 'https://flatteredwithflutter.com/';
  static const String youtube = 'https://www.youtube.com/aseemwangoo';
  static const String medium = 'https://medium.com/@aseemwangoo';
  static const String devTo = 'https://dev.to/aseemwangoo';
  static const String github = 'https://github.com/aseemwangoo';
  static const String codepen = 'https://codepen.io/aseemwangoo/pens/public';
  static const String support = 'https://support.flatteredwithflutter.com/';
}

class OptionAndRoutes {
  OptionAndRoutes._();

  static const Map<String, String> optionRoutes = {
    // ApplevelConstants.option1: ApplevelConstants.sampleRoute,
    ApplevelConstants.option12: ApplevelConstants.selectorsRoute,
    ApplevelConstants.option3: ApplevelConstants.iframeRoute,
    ApplevelConstants.option4: ApplevelConstants.parallaxRoute,
    ApplevelConstants.option5: ApplevelConstants.locationRoute,
    ApplevelConstants.option6: ApplevelConstants.mlRoute,
    ApplevelConstants.option7: ApplevelConstants.gameRoute,
    ApplevelConstants.option8: ApplevelConstants.dtRoute,
    ApplevelConstants.option9: ApplevelConstants.hooksRoute,
    ApplevelConstants.option10: ApplevelConstants.codepenRoute,
    ApplevelConstants.option11: ApplevelConstants.streamsRoute,
    ApplevelConstants.option2: ApplevelConstants.googleRoute,
    ApplevelConstants.option13: ApplevelConstants.visitedPagesRoute,
  };

  static const Map<String, List<String>> linksRoutes = {
    // ApplevelConstants.option1: <String>[
    //   BrandLinks.medium,
    //   BrandLinks.website,
    //   BrandLinks.youtube
    // ],
    ApplevelConstants.option2: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option3: <String>[
      IFrameConstants.medium,
      IFrameConstants.website,
      IFrameConstants.youtube
    ],
    ApplevelConstants.option4: <String>[
      ParallaxConstants.medium,
      ParallaxConstants.website,
      ParallaxConstants.youtube
    ],
    ApplevelConstants.option5: <String>[
      LocationConstants.medium,
      LocationConstants.website,
      LocationConstants.youtube
    ],
    ApplevelConstants.option6: <String>[
      MLConstants.medium,
      MLConstants.website,
      MLConstants.youtube
    ],
    ApplevelConstants.option7: <String>[
      GameUtils.medium,
      GameUtils.website,
      GameUtils.youtube
    ],
    ApplevelConstants.option8: <String>[
      DataTableConstants.medium,
      DataTableConstants.website,
      DataTableConstants.youtube
    ],
    ApplevelConstants.option9: <String>[
      HookScreenConstants.medium,
      HookScreenConstants.website,
      HookScreenConstants.youtube
    ],
    ApplevelConstants.option10: <String>[
      CodepenConstants.medium,
      CodepenConstants.website,
      CodepenConstants.youtube
    ],
    ApplevelConstants.option11: <String>[
      StreamFormConstants.medium,
      StreamFormConstants.website,
      StreamFormConstants.youtube
    ],
    ApplevelConstants.option12: <String>[
      SelectorsConstants.medium,
      SelectorsConstants.website,
      SelectorsConstants.youtube
    ],
    ApplevelConstants.option13: <String>[
      NavConstants.medium,
      NavConstants.website,
      NavConstants.youtube
    ],
  };
}

class DrawerOptions {
  DrawerOptions._();

  static const String info = 'About Website';
  static const String youtube = 'See on Youtube';
  static const String website = 'View on Website';
  static const String medium = 'Read on Medium';
  static const String legalese = 'Experiments with Flutter Web';
}

class OptionsModel {
  OptionsModel._();

  static List<ArticlesModel> options() {
    var _favModelList = <ArticlesModel>[];

    final _optionRoutes = OptionAndRoutes.optionRoutes;
    final _linkRoutes = OptionAndRoutes.linksRoutes;

    for (var _optionRoute in _optionRoutes.entries) {
      final _favModel = ArticlesModel();

      _favModel.articleID = _optionRoute.value;
      _favModel.articleName = _optionRoute.key;
      _favModel.articleRoute = _optionRoute.value;
      _favModel.articleLinks = _linkRoutes[_optionRoute.key];

      _favModelList.add(_favModel);
    }
    return _favModelList;
  }
}
