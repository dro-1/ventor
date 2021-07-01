import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;

  Tag(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
      padding: EdgeInsets.all(5),
      child: Center(
          child: Text(
        '#$tag',
        textAlign: TextAlign.center,
      )),
    );
  }
}
