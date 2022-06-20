import 'package:flutter/material.dart';

class DrawerElement extends StatefulWidget {
  final String listName;
  final Icon listIconLead;
  final Icon listIconTrail;
  final String routeName;
  const DrawerElement(
      this.listName,
      this.listIconLead,
      this.listIconTrail,
      this.routeName,
      {Key? key}) : super(key: key);

  @override
  _DrawerElementState createState() => _DrawerElementState();
}

class _DrawerElementState extends State<DrawerElement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.listName,
            textAlign: TextAlign.center,
          ),
          leading: widget.listIconLead,
          trailing: widget.listIconTrail,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, widget.routeName);
          },
        ),
        const Divider(
          color: Color.fromRGBO(17, 22, 51, 1.0),
          height: 1,
          thickness: 0.8,
        ),
      ],
    );
  }
}
