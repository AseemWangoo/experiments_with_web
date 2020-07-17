class ApplevelConstants {
  ApplevelConstants._();

  static const double stdWidth = 1366;
  static const double stdHeight = 768;

  static const String titleOnTab = 'Fluttering';

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
  static const String option10 = 'My Codepenz';
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
}

class OptionAndRoutes {
  OptionAndRoutes._();

  static const Map<String, String> optionRoutes = {
    ApplevelConstants.option1: ApplevelConstants.sampleRoute,
    ApplevelConstants.option2: ApplevelConstants.googleRoute,
    ApplevelConstants.option3: ApplevelConstants.iframeRoute,
    ApplevelConstants.option4: ApplevelConstants.parallaxRoute,
    ApplevelConstants.option5: ApplevelConstants.locationRoute,
    ApplevelConstants.option6: ApplevelConstants.mlRoute,
    ApplevelConstants.option7: ApplevelConstants.gameRoute,
    ApplevelConstants.option8: ApplevelConstants.dtRoute,
    ApplevelConstants.option9: ApplevelConstants.hooksRoute,
    ApplevelConstants.option10: ApplevelConstants.codepenRoute,
  };

  static const Map<String, List<String>> linksRoutes = {
    ApplevelConstants.option1: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option2: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option3: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option4: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option5: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option6: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option7: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option8: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option9: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
    ],
    ApplevelConstants.option10: <String>[
      BrandLinks.medium,
      BrandLinks.website,
      BrandLinks.youtube
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
