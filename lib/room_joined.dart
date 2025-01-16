import 'firebase_options.dart'; // Assuming this file contains Firebase options
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:torch_controller/torch_controller.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

bool torch = false;

void main() {
  TorchController().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JoinedRoomPage(rows: 2, columns: 2), // Example rows and columns values
    );
  }
}

class JoinedRoomPage extends StatefulWidget {
  final int rows;
  final int columns;

  JoinedRoomPage({required this.rows, required this.columns});

  @override
  _JoinedRoomPageState createState() => _JoinedRoomPageState();
}

class _JoinedRoomPageState extends State<JoinedRoomPage> {
  String ledString = '';
  int firebase_rows = 0;
  int firebase_columns = 0;
  int? validity = null; //"2" represents torch must be off and "1" must be
  double firebase_lat = 0;
  double firebase_long = 0;
  double distance = 0;
  bool isLoading = true; // Initially set loading to true

  late Timer _timer;

  void startPeriodicFetch() {
    fetchLedString(); // Fetch immediately on start
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      fetchLedString(); // Fetch again every 5 seconds
    });
  }

  void stopPeriodicFetch() {
    _timer.cancel();
  }

  final controller = TorchController();

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    startPeriodicFetch();
    controller.initialize(); // Initialize the TorchController
  }

  // Initialize Firebase
  Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // Fetch LED String from Firestore
  Future<void> fetchLedString() async {
    try {
      // Get the current location of the user
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Fetch the first document from the 'led_strings' collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('led_strings')
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the value of 'ledString' from the first document
        setState(() {
          ledString = querySnapshot.docs.first.get('ledString');
          firebase_rows = querySnapshot.docs.first.get('rows');
          firebase_columns = querySnapshot.docs.first.get('columns');
          firebase_lat = querySnapshot.docs.first.get('latitude');
          firebase_long = querySnapshot.docs.first.get('longitude');
          validity = checkValidity(widget.rows, widget.columns, firebase_rows,
              firebase_columns, ledString);

          // Calculate distance between user's location and firebase location
          distance = Geolocator.distanceBetween(
              position.latitude, position.longitude, firebase_lat, firebase_long);

          if (validity == 1 && torch == false) {
            controller.toggle(intensity: 1); // Turn on the torch if LED String is Torch On
            torch = true;
          } else if (validity == 2 && torch == true) {
            controller.toggle(intensity: 1); // Turn off the torch if LED String is not Torch On
            torch = false;
          }
        });
      }
    } catch (error) {
      print('Error fetching led_string: $error');
    } finally {
      // After data is fetched or if there's an error, set isLoading to false
      setState(() {
        isLoading = false;
      });
    }
  }

  // Check the validity of data
  int checkValidity(int rows, int columns, int firebaseRows, int firebaseColumns, String ledString) {
    // Add your logic here to determine the validity
    if (rows <= firebaseRows && columns <= firebaseColumns && ledString.isNotEmpty) {
      // Rows, columns, and ledString match, so return 0
      int flat = (rows - 1) * firebase_columns + columns - 1;
      if (ledString[flat] == 'O')
        return 1;
      else
        return 2;
    } else {
      // Otherwise, return 1 for invalid data
      return 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joined Room'),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(), // Show loading indicator
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joined Room',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      title: Text('Your Row No.: ${widget.rows}'),
                    ),
                    ListTile(
                      title: Text('Your Column No: ${widget.columns}'),
                    ),
                    ListTile(
                      title:
                      Text('Total No of Rows: $firebase_rows'),
                    ),
                    ListTile(
                      title:
                      Text('Total No of Columns: $firebase_columns'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
              Center(
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          validity == 1
                              ? 'LED String: Torch On'
                              : validity == 2
                              ? 'LED String: Torch Off'
                              : 'Invalid data!',
                          style: TextStyle(
                            fontSize: 18,
                            color: validity == 3 ? Colors.red : null,
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: validity == 1 || validity == 2
                              ? Image.asset(
                            validity == 1
                                ? 'assets/torch_on.png'
                                : 'assets/torch_off.png',
                            height: 100,
                            width: 100,
                          )
                              : Image.asset(
                            'assets/torch_invalid.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            SizedBox(height: 24),
            if (distance > 1000)
              Card(
                elevation: 4.0,
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'You are $distance meters away from the event',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }



  @override
  void dispose() {
    stopPeriodicFetch();
    super.dispose();
  }
}