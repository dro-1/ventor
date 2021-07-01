import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ventor/providers/event_provider.dart';
import 'package:ventor/widgets/tag_widget.dart';

class EventInfoScreen extends StatefulWidget {
  static const routeName = '/event-info';

  @override
  _EventInfoScreenState createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {
  bool isDescriptionShowing = false;
  final List<String> tags = [
    'React',
    'Python',
    'Javascript',
    'Frontend',
    'DevOps'
  ];

  final eventDescription =
      'This group was created for GDG’s  in Nigeria.  Its a way of connecting people together.We facititate and nuture people from various universities around the world.';

  Widget buildStatCount(int statCount, String statName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color.fromRGBO(255, 136, 209, 1),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Text(
            '$statCount',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          statName,
          style: TextStyle(
            color: Color.fromRGBO(255, 136, 209, 1),
            fontSize: 20,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context).settings.arguments as Event;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(event.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.4), BlendMode.color),
                ),
              ),
              child: Container(
                height: 200,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          event.title,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildStatCount(300, 'Likes'),
                              buildStatCount(360, 'Comments')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          event.host,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(76, 59, 94, 1),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_pin),
                            Text(
                              'Lagos, Nigeria',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(76, 59, 94, 1),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(40, 45, 47, 1),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                            icon: Icon(isDescriptionShowing
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                            onPressed: () => setState(() {
                                  isDescriptionShowing = !isDescriptionShowing;
                                })),
                      ],
                    ),
                  ),
                  if (isDescriptionShowing)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        eventDescription,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.calendar_today),
                            Text(DateFormat.yMMMMEEEEd().format(event.date),
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        childAspectRatio: 5 / 2,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (ctx, idx) => Tag(tags[idx]),
                      itemCount: tags.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
