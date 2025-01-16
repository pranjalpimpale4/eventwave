import 'package:flutter/material.dart';
import 'convert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Assuming this file contains Firebase options
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'main.dart';

class NewRoomPage extends StatelessWidget {
  final String message;
  final int rows;
  final int columns;

  // Constructor to receive data from CreateRoomPage
  const NewRoomPage({super.key,
    required this.message,
    required this.rows,
    required this.columns,
  });

  @override


  Widget build(BuildContext context) {
    // Call the main function from convert.dart and pass message, rows, and columns
    String ledString = convertAndReturnString(message.toUpperCase(), rows, columns);
    _addOrUpdateLedString(ledString, rows, columns); // Call function to add or update LED string in Firestore

    return Scaffold(
      appBar: AppBar(
        title: Text('New Room'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Message: $message',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Total No. of Rows: $rows',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Total No. of Columns: $columns',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Successfully created a new room, now you can join the room',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Container(
                  height: 200, // Adjust the height as needed
                  width: double.infinity, // Take full width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/meme.jpg'), // Adjust the image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinRoomPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[900], // Change button color
                    primary: Colors.lightBlue[900], // Fix button color
                    onPrimary: Colors.white, // Change text color
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      'Join Room',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  // Method to add or update LED string, rows, columns, latitude, and longitude in Firestore
  Future<void> _addOrUpdateLedString(String ledString, int rows, int columns) async {
    try {
      // Get current live location
      Position position = await _determinePosition();
      double latitude = position.latitude;
      double longitude = position.longitude;

      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Get reference to Firestore collection
      CollectionReference ledCollection = FirebaseFirestore.instance.collection('led_strings');

      // Check if LED string already exists in Firestore
      QuerySnapshot querySnapshot = await ledCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        // If LED string exists, update it
        DocumentSnapshot doc = querySnapshot.docs.first;
        await ledCollection.doc(doc.id).update({
          'ledString': ledString,
          'rows': rows,
          'columns': columns,
          'latitude': latitude,  // Add latitude
          'longitude': longitude,  // Add longitude
        });
      } else {
        // If LED string does not exist, add it
        await ledCollection.add({
          'ledString': ledString,
          'rows': rows,
          'columns': columns,
          'latitude': latitude,  // Add latitude
          'longitude': longitude,  // Add longitude
        });
      }
    } catch (e) {
      print('Error adding or updating LED string: $e');
    }
  }

  // Method to retrieve the user's current live location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, throw error
      throw Exception('Location services are disabled.');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Location permission denied, request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied, throw error
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission denied forever, throw error
      throw Exception('Location permissions are permanently denied.');
    }

    // Permissions are granted, continue accessing the position of the device
    return await Geolocator.getCurrentPosition();
  }
}
