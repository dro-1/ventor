import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String username = '';
  String email = '';
  String name = '';
  String token = '';
  bool isModerator = false;
  String imageUrl = '';
  String imageId = '';

  Future<http.Response> signUp(
    String username,
    String name,
    String email,
    String password,
    bool isModerator,
    String imageUrl,
    String imageId,
  ) async {
    var url = Uri.parse('https://api-ventor.herokuapp.com/user/register');

    this.username = username;
    this.email = email;

    var body = {
      'name': name,
      'password': password,
      'email': email,
      'username': username,
      'is_moderator': isModerator,
      'profile_photo': imageUrl,
      'profile_photo_id': imageId
    };
    return http.post(url, body: json.encode(body));
  }

  Future<void> signOut() {
    name = '';
    email = '';
    isModerator = false;
    username = '';
    imageUrl = '';
    imageId = '';
    token = '';

    notifyListeners();
    return null;
  }

  Future<bool> signIn(String usernameOrEmail, String password) async {
    var url = Uri.parse('https://api-ventor.herokuapp.com/auth/');
    try {
      var body = {
        'email': usernameOrEmail,
        'password': password,
      };
      var response = await http.post(url, body: json.encode(body));
      print(response.body);
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);
        token = decodedResponse['access_token'];
        url = Uri.parse('https://api-ventor.herokuapp.com/user/profile');
        print(token);
        var response2 = await http.get(url, headers: {
          'access_token': token,
        });
        print(response2.body);
        if (response2.statusCode == 200) {
          var decodedResponse2 = json.decode(response2.body);
          print(decodedResponse2);
          name = decodedResponse2['user_data']['name'];
          email = decodedResponse2['user_data']['email'];
          isModerator = decodedResponse2['user_data']['is_moderator'];
          username = decodedResponse2['user_data']['username'];
          imageUrl = decodedResponse2['user_data']['imageUrl'];
          imageId = decodedResponse2['user_data']['imageId'];
          notifyListeners();
        }
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
