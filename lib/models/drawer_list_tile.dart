import 'package:flutter/material.dart';


class DrawerListTileStructure {
final String name;
final Icon leadIcon;
final Icon trailIcon;
final String routeName;
final Function? action;

DrawerListTileStructure({
  required this.name,
  required this.leadIcon,
  required this.trailIcon,
  required this.routeName,
  this.action,
  });
}