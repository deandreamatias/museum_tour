import 'package:flutter/material.dart';

class DialogMuseum extends StatelessWidget {
  const DialogMuseum({
    Key key,
    this.title,
    this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CERRAR'),
        ),
      ],
    );
  }
}
