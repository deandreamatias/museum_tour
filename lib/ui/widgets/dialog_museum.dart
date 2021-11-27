import 'package:flutter/material.dart';

class DialogMuseum extends StatelessWidget {
  const DialogMuseum({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CERRAR'),
        ),
      ],
    );
  }
}
