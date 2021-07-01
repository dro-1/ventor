import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ventor/providers/comment_provider.dart';
import 'package:ventor/providers/event_provider.dart';
import 'package:ventor/widgets/comment_widget.dart';

class LiveEventScreen extends StatelessWidget {
  static const routeName = '/live-event';
  final List<Comment> comments = [
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
    new Comment('Arby Jegede', 'Hello, Thanks for coming to this event',
        'assets/images/commenter.png', DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context).settings.arguments as Event;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 66),
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
                                color: Color.fromRGBO(255, 136, 209, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(40, 45, 47, 1),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          '5 Comments',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          '6 Likes',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) => CommentWidget(comments[idx]),
                    itemCount: comments.length,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            left: 0,
            bottom: 0,
            child: Container(
              color: Color.fromRGBO(40, 45, 47, 1),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    fillColor: Colors.white,
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
