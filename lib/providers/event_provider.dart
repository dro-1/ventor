import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ventor/providers/user_provider.dart';

class Event {
  final String title;
  final String image;
  final String host;
  final DateTime date;

  Event(this.title, this.image, this.host, this.date);
}

class EventProvider with ChangeNotifier {
  final Auth _auth;

  EventProvider(this._auth);

  List<Event> _events = [];

  List<Event> get eventList {
    return [..._events];
  }

  Future<void> createEvent(
    String name,
    String description,
    String duration,
    String thumbnail,
    DateTime startTime,
    DateTime endTime,
  ) async {
    var url = Uri.parse('https://api-ventor.herokuapp.com/event/');
    try {
      var body = {
        'event_name': name,
        'description': description,
        'duration': duration,
        'thumbnail': thumbnail,
        'start_time': startTime.millisecondsSinceEpoch,
        'end_time': endTime.millisecondsSinceEpoch,
      };
      var response = await http.post(url, body: json.encode(body), headers: {
        'access_token': _auth.token,
      });
      print(response.body);
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);

        notifyListeners();

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
