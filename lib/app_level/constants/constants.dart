class ApplevelConstants {
  ApplevelConstants._();

  static const double stdWidth = 1366;
  static const double stdHeight = 768;

  static const String titleOnTab = 'Web';

  static const String homeRoute = '/';

  static const String sampleRoute = '/sample';
  static const String googleRoute = '/google-clone';
  static const String iframeRoute = '/iframe';
  static const String parallaxRoute = '/parallax';
  static const String locationRoute = '/location';
  static const String mlRoute = '/ml';
  static const String gameRoute = '/game';

  /* MENU OPTIONS */
  static const String option1 = 'Sample';
  static const String option2 = 'Google';
  static const String option3 = 'Iframe';
  static const String option4 = 'Parallax';
  static const String option5 = 'Location';
  static const String option6 = 'ML';
  static const String option7 = 'Game Time';
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
  };
}

class DrawerOptions {
  DrawerOptions._();

  static const String info = 'More Info';
  static const String youtube = 'See on Youtube';
  static const String medium = 'Read on Medium';
  static const String legalese = 'Experiments with Flutter Web';
}
