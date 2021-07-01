import 'package:flutter/material.dart';
import 'package:ventor/providers/comment_provider.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
          leading: Image.asset(
            comment.image,
            fit: BoxFit.contain,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Arby Jegede',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.verified),
                    ],
                  ),
                  Text(
                    '2 mins ago',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hi Everyone, The pleasure is mine',
                textAlign: TextAlign.start,
              )
            ],
          )),
    );
  }
}
