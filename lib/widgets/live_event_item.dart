import 'package:flutter/material.dart';
import 'package:ventor/providers/event_provider.dart';

class LiveEventItem extends StatelessWidget {
  final Event event;
  LiveEventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Live',
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 58),
            IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {})
          ],
        ),
        Image.asset(
          'assets/images/event-image.png',
          height: 50,
          fit: BoxFit.cover,
        ),
        Text(
          event.title,
          style: TextStyle(
            color: Color.fromRGBO(40, 45, 47, 1),
            fontSize: 18,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Host: ${event.host}',
          style: TextStyle(
            color: Color.fromRGBO(40, 45, 47, 1),
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.calendar_today),
              Text(
                'Sep 29',
                style: TextStyle(
                  color: Color.fromRGBO(40, 45, 47, 1),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
