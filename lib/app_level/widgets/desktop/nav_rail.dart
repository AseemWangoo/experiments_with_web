import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavRail extends StatefulWidget {
  const NavRail({
    Key key,
    @required this.optionWidgets,
  })  : assert(optionWidgets.length > 0),
        super(key: key);

  final List<Widget> optionWidgets;

  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //
    final _width = ScreenQueries.instance.width(context) * 0.07;

    return Row(
      children: <Widget>[
        NavigationRail(
          minWidth: _width,
          backgroundColor: Colors.black,
          destinations: _createOptions,
          labelType: NavigationRailLabelType.all,
          onDestinationSelected: (int i) => _onOptionSelected(i),
          selectedIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedLabelTextStyle:
              Theme.of(context).textTheme.button.c(Colors.grey),
          selectedLabelTextStyle:
              Theme.of(context).textTheme.button.c(Colors.white),
        ),
        //

        Expanded(child: widget.optionWidgets[_selectedIndex]),
      ],
    );
  }

  void _onOptionSelected(int index) {
    // final _nav = Navigator.of(context);
    // switch (index) {
    //   case 1:
    //     _nav.pushNamed(ApplevelConstants.favRoute);
    //     break;

    //   case 2:
    //     _nav.pushNamed(ApplevelConstants.mobileRoute);
    //     break;

    //   case 3:
    //     _nav.pushNamed(ApplevelConstants.desktopRoute);
    //     break;

    //   default:
    //     _nav.pushNamed(ApplevelConstants.homeRoute);
    // }

    setState(() => _selectedIndex = index);
  }

  List<NavigationRailDestination> get _createOptions {
    final _options = [
      const NavigationRailDestination(
        icon: FaIcon(FontAwesomeIcons.home),
        label: Text('Home'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.favorite_border),
        label: Text('Favorites'),
        selectedIcon: Icon(Icons.favorite),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.mobile_friendly),
        label: Text('Mobile Links'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.desktop_mac),
        label: Text('Desktop Links'),
      ),
    ];
    return _options;
  }
}
