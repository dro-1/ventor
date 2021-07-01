import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventor/providers/event_provider.dart';

class NewEventScreen extends StatefulWidget {
  static const routeName = '/new-event-screen';

  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _imageUrlController = TextEditingController();

  var isLoading = false;

  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();

  TimeOfDay _selectedStartTime = TimeOfDay.now();
  TimeOfDay _selectedEndTime = TimeOfDay.now();

  DateTime convertToDateTime(TimeOfDay time, DateTime date) {
    return new DateTime(
        date.year, date.month, date.day, time.hour, time.minute);
  }

  void _presentStartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedStartDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedStartDate = pickedDate;
      });
    });
  }

  void _presentEndDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedEndDate,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedEndDate = pickedDate;
      });
    });
  }

  void _presentStartTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _selectedStartTime,
    ).then((pickedTime) {
      _selectedStartTime = pickedTime;
    });
  }

  void _presentEndTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _selectedEndTime,
    ).then((pickedTime) {
      _selectedEndTime = pickedTime;
    });
  }

  void submitEventCreation() async {
    setState(() {
      isLoading = true;
    });
    final name = _nameController.value.text;
    final description = _descriptionController.value.text;
    final duration = _durationController.value.text;
    final thumbnail = _imageUrlController.value.text;
    print(_selectedStartTime);
    print(_selectedEndTime);
    print(_selectedStartDate);
    print(_selectedEndDate);
    final startTime = convertToDateTime(_selectedStartTime, _selectedStartDate);
    final endTime = convertToDateTime(_selectedEndTime, _selectedEndDate);

    print(startTime);
    print(endTime);
    try {
      var response = await Provider.of<EventProvider>(context, listen: false)
          .createEvent(
              name, description, duration, thumbnail, startTime, endTime);
      // if (response.statusCode == 200) {
      //   var decodedResponse = json.decode(response.body);
      //   print(decodedResponse);
      //   setState(() {
      //     isSignupSuccessful = true;
      //   });
      //   Future.delayed(
      //       const Duration(milliseconds: 3000),
      //       () => setState(() {

      //           }));
      // }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
                'https://cdn.pixabay.com/photo/2015/03/11/02/13/shiny-668054_960_720.jpg',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).padding.top + 150,
              20,
              20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    focusColor: Color.fromRGBO(255, 136, 209, 1),
                  ),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _durationController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    focusColor: Color.fromRGBO(255, 136, 209, 1),
                  ),
                ),
                TextField(
                  controller: _imageUrlController,
                  style: TextStyle(color: Colors.white),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Image URL',
                    focusColor: Color.fromRGBO(255, 136, 209, 1),
                  ),
                ),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        onPressed: _presentStartDatePicker,
                        color: Colors.black87,
                        child: Text(
                          'Choose Start Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        onPressed: _presentStartTimePicker,
                        color: Colors.black87,
                        // style: ButtonStyle(
                        //   foregroundColor:
                        //       MaterialStateProperty.all<Color>(Colors.white),
                        // ),
                        child: Text(
                          'Choose Start Time',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        onPressed: _presentEndDatePicker,
                        color: Colors.black87,
                        child: Text(
                          'Choose End Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        onPressed: _presentEndTimePicker,
                        color: Colors.black87,
                        // style: ButtonStyle(
                        //   foregroundColor:
                        //       MaterialStateProperty.all<Color>(Colors.white),
                        // ),
                        child: Text(
                          'Choose End Time',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () => submitEventCreation(),
                  child: Text('Create Event'),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
