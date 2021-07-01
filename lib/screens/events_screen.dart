import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventor/providers/event_provider.dart';
import 'package:ventor/providers/user_provider.dart';
import 'package:ventor/screens/new_event_screen.dart';
import 'package:ventor/widgets/event_item_widget.dart';
import 'package:ventor/widgets/live_event_item.dart';

const tabValues = ['Trending', 'React', 'Python', 'Golang'];

// Widget buildTab(String title) {
//   return Scaffold(
//     body: Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(top: 16),
//       width: double.infinity,
//       child: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//             itemCount: 2,
//             itemBuilder: (ctx, idx) => EventItem(),
//           ))
//         ],
//         mainAxisAlignment: MainAxisAlignment.center,
//       ),
//     ),
//   );
// }

class EventsScreen extends StatelessWidget {
  final List<Event> events = [
    new Event('XYZ Event', 'assets/images/event-image.png', 'GDG Lagos',
        DateTime.now()),
    new Event('XYZ Event', 'assets/images/event-image.png', 'GDG Lagos',
        DateTime.now()),
    new Event('XYZ Event', 'assets/images/event-image.png', 'GDG Lagos',
        DateTime.now()),
    new Event('XYZ Event', 'assets/images/event-image.png', 'GDG Lagos',
        DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Auth>(context).name;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(40, 45, 47, 1),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile-pic.png',
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Hi $name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => Navigator.of(context)
                                .pushNamed(NewEventScreen.routeName),
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.logout),
                            onPressed: () =>
                                Provider.of<Auth>(context, listen: false)
                                    .signOut(),
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'More',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.arrow_right, color: Colors.white),
                            ],
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                        ),
                      ]),
                  Container(
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  LiveEventItem(events[index]),
                              itemCount: events.length),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Events',
                          style: TextStyle(
                            color: Color.fromRGBO(40, 45, 47, 1),
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.settings,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) =>
                              EventItem(events[index]),
                          itemCount: events.length),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
