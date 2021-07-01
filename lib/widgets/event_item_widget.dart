import 'package:flutter/material.dart';
import 'package:ventor/providers/event_provider.dart';
import 'package:ventor/screens/event_info_screen.dart';
import 'package:ventor/screens/live_event_screen.dart';

class EventItem extends StatelessWidget {
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(LiveEventScreen.routeName, arguments: event);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset('assets/images/event-image.png'),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    label: Text('10'),
                  ),
                ],
              ),
              Text(
                'A Tech Event To Bring Communities Together',
                style: TextStyle(
                  color: Color.fromRGBO(40, 45, 47, 1),
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text('Lagos, Nigeria'),
                    ],
                  ),
                  Container(
                    width: 80,
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
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            EventInfoScreen.routeName,
                            arguments: event);
                      },
                      child: Text(
                        'More Info',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 136, 209, 1),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
