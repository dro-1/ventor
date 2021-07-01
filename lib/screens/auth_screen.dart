import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventor/providers/user_provider.dart';

enum AuthMode { Login, Signup }

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode authMode = AuthMode.Login;
  bool isModerator = false;
  bool isLoading = false;
  bool isSignupSuccessful = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  void submitSignUp() async {
    setState(() {
      isLoading = true;
    });
    final name = _nameController.value.text;
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    final username = _usernameController.value.text;
    try {
      var response = await Provider.of<Auth>(context, listen: false)
          .signUp(username, name, email, password, isModerator, ' ', ' ');
      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);
        setState(() {
          isSignupSuccessful = true;
        });
        Future.delayed(
            const Duration(milliseconds: 3000),
            () => setState(() {
                  authMode = AuthMode.Login;
                }));
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void submitSignIn() async {
    setState(() {
      isLoading = true;
    });
    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    await Provider.of<Auth>(context, listen: false).signIn(email, password);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2020/02/23/15/09/woman-4873600_960_720.jpg',
                  fit: BoxFit.cover),
            ),
            authMode == AuthMode.Login
                ? Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign In',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Username / Email',
                            focusColor: Color.fromRGBO(255, 136, 209, 1),
                          ),
                        ),
                        TextField(
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          enableInteractiveSelection: false,
                          onSubmitted: (_) => submitSignIn,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            focusColor: Color.fromRGBO(255, 136, 209, 1),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              authMode = AuthMode.Signup;
                            });
                          },
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                onPressed: isLoading ? null : submitSignIn,
                                child: isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.grey,
                                        ),
                                      )
                                    : Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                              'Get access to amazing events from the comfort of your home.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          SizedBox(height: 20),
                          TextField(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Name',
                              focusColor: Color.fromRGBO(255, 136, 209, 1),
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              focusColor: Color.fromRGBO(255, 136, 209, 1),
                            ),
                          ),
                          TextField(
                            textInputAction: TextInputAction.next,
                            controller: _usernameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              focusColor: Color.fromRGBO(255, 136, 209, 1),
                            ),
                          ),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            autocorrect: false,
                            enableSuggestions: false,
                            onSubmitted: (_) => submitSignUp,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              focusColor: Color.fromRGBO(255, 136, 209, 1),
                            ),
                          ),
                          SizedBox(height: 10),
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: CheckboxListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(
                                "Are You A Moderator ?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              value: isModerator,
                              onChanged: (newValue) {
                                setState(() {
                                  isModerator = newValue;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .trailing, //  <-- leading Checkbox
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authMode = AuthMode.Login;
                              });
                            },
                            child: Text(
                              'Have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: isLoading || isSignupSuccessful
                                      ? null
                                      : submitSignUp,
                                  child: isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.grey,
                                          ),
                                        )
                                      : Text(
                                          isSignupSuccessful
                                              ? 'Successful'
                                              : 'Register',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
