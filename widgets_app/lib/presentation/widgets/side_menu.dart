import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => setState(() {
        navDrawerIndex = value;
        Scaffold.of(context).closeDrawer();
        context.push(appMenuItems[value].link);
      }),
      children: [
        const DrawerHeader(child: Text('Drawer Header')),
        ...appMenuItems.sublist(0, 3).map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Text('More options'),
        ),
        ...appMenuItems.sublist(3).map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
      ],
    );
  }
}
