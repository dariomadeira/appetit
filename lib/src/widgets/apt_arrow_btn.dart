import 'package:flutter/material.dart';

class AptArrowBtn extends StatelessWidget {

  final IconData icon;
  final Function accion;

  const AptArrowBtn({
    Key key, 
    @required this.icon,
    @required this.accion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: accion,
      child: Icon(
        icon,
        color: Colors.green[600],
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(40, 40),
        shape: CircleBorder(),
        side: BorderSide(
          width: 2,
          color: Colors.green[600],
        ),
        primary: Colors.green[600].withOpacity(0.2),
      ),
    );
  }
}