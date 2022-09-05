import 'package:flutter/material.dart';

class ElementaryButton extends StatelessWidget {
  final String _name;
  final VoidCallback? _function;
  final Color? _color;
  const ElementaryButton(
      this._name,
      this._function,
      this._color,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      child: Text(_name),
      onPressed:  _function,
      style: ElevatedButton.styleFrom(
          primary: _color,
          fixedSize:
          Size(
            _screenSize.width,
            55.0,),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
          )
      ),
    );
  }
}
