import 'package:flutter/widgets.dart' show AssetImage;

class WebAssets {
  WebAssets._();

  /* BRAND LOGO */
  static const logo = AssetImage('assets/images/logo.png');

  static const flareBkgrd = AssetImage('assets/animations/spaceman.flr');
  static const homeBg = AssetImage('assets/images/background.jpg');

  /* Parallax */
  static const socialDistance = AssetImage('assets/images/social_distance.jpg');
  static const covidEssentials = AssetImage(
    'assets/images/covid19_essentials.png',
  );

  static const covidFinancials = AssetImage(
    'assets/images/covid19_financial.png',
  );

  static const covidHands = AssetImage('assets/images/covid19_hands.png');
  static const covidHeart = AssetImage('assets/images/covid19_heart.png');
  static const covidIsolation = AssetImage(
    'assets/images/covid19_selfisolation.png',
  );
  static const covidStayhome = AssetImage('assets/images/covid19_stayhome.png');

  static const covidKind = AssetImage('assets/images/covid19_heart.png');
  static const covidHome = AssetImage('assets/images/covid19_stayhome.png');
  static const covidWashHands = AssetImage('assets/images/covid19_hands.png');

  /* Game Time */
  static const enemy = AssetImage('assets/images/virus/enemy.png');
  static const gameBg = AssetImage('assets/images/bg/room.png');
}

class DesktopAssets {
  DesktopAssets._();

  static const threeD = AssetImage('assets/images/dsktp_3d.png');
  static const ffi = AssetImage('assets/images/dsktp_dart_ffi.jpg');
  static const plugin = AssetImage('assets/images/dsktp_plugin.png');

  static const darkModeVignette =
      AssetImage('assets/images/dsktp_v_darkmode.png');

  static const liquidCardsVignette = AssetImage('assets/images/dsktp_v_lc.png');

  static const boardingVignette = AssetImage('assets/images/dsktp_v_pass.png');
  static const dsktp = AssetImage('assets/images/dsktp.png');
}

class MobileAssets {
  MobileAssets._();

  static const fday = AssetImage('assets/images/ntv_f_day.png');
  static const services = AssetImage('assets/images/ntv_services.png');
  static const sockets = AssetImage('assets/images/ntv_sockets.png');
  static const tab = AssetImage('assets/images/ntv_tab.png');
  static const testProv = AssetImage('assets/images/ntv_testing_provider.png');

  static const aws = AssetImage('assets/images/ntv_aws.png');
  static const moor = AssetImage('assets/images/ntv_moor.png');
  static const provStreams = AssetImage('assets/images/ntv_prov_streams.png');
  static const prov = AssetImage('assets/images/ntv_provider.png');
  static const rekog = AssetImage('assets/images/ntv_rekog.png');
}
