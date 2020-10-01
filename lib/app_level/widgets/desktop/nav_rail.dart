import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavRail extends StatefulWidget {
  const NavRail({Key key}) : super(key: key);

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
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const FaIcon(FontAwesomeIcons.home),
              label: const Text('Home'),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.favorite_border),
              label: const Text('Favorites'),
              selectedIcon: const Icon(Icons.favorite),
            ),
          ],
          labelType: NavigationRailLabelType.all,
          onDestinationSelected: (int index) {
            setState(() => _selectedIndex = index);
          },
          selectedIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedLabelTextStyle:
              Theme.of(context).textTheme.button.c(Colors.grey),
          selectedLabelTextStyle:
              Theme.of(context).textTheme.button.c(Colors.white),
        ),
        Expanded(
          child: Center(
            child: Text(
              'selectedIndex: $_selectedIndex',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ],
    );
  }
}
