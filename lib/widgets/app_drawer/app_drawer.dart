import 'package:flutter/material.dart';
import '../app_drawer/wallet_element.dart';

import './drawer_element.dart';
import '../../models/drawer_list_tile.dart';
import '../../providers/dummy_data.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  _MyAppDrawerState createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  List<DrawerListTileStructure> drawerElementList = AppStructure().drawerElements;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:  Theme.of(context).colorScheme.secondary,
        child: ListView(
          children: [
            AppBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.primary,
              automaticallyImplyLeading: false,
              leading: const Icon(
                Icons.help,
                size: 20,
              ),
              title: const Text(
                'قائمتي',
              ),
              centerTitle: true,
              actions: const [
                SizedBox(),
              ],
            ),
            ...drawerElementList.map((e) {
              return
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 2,
                ),
                child: DrawerElement(
                  e.name,
                  e.leadIcon,
                  e.trailIcon,
                  e.routeName,
                ),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            const MyWallet(),
          ],
        ),
      ),
    );
  }
}
