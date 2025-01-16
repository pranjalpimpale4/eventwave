import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'firebase_options.dart';
import 'chat_page.dart';
import 'new_room.dart';
import 'room_joined.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventWave',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late String _currentUserID;

  @override
  void initState() {
    super.initState();
    _loadUserID();
  }

  _loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUserID = prefs.getString('userID');
    if (savedUserID != null) {
      setState(() {
        _currentUserID = savedUserID;
      });
    } else {
      // Generate and save a new UUID
      _currentUserID = _generateUserID();
      prefs.setString('userID', _currentUserID);
    }
  }

  String _generateUserID() {
    // Generate a UUID (Universally Unique Identifier)
    var uuid = const Uuid();
    return uuid.v4();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4, // Add elevation for a pronounced look
        backgroundColor: Colors.lightBlue[900], // Change AppBar color
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 30,
              // Adjust the width if needed
            ),
            const SizedBox(width: 10), // Add spacing between logo and title
            const Text(
              'EventWave',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Change text color
                fontFamily: 'Roboto', // Change font
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Join the ongoing conversation or start a new one. There\'s only one EventWave room at a time',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              child: Image.asset('assets/createRoom.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0), // Adjust the value as needed
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[900], // Change button color
                  foregroundColor: Colors.white, // Change text color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateRoomPage(),
                    ),
                  );
                },
                child: const Text('Create Room'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300, // Adjust the width as needed
              height: 220, // Adjust the height as needed
              child: Image.asset('assets/joinRoom.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0), // Adjust the value as needed
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[900], // Change button color
                  foregroundColor: Colors.white, // Change text color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JoinRoomPage(),
                    ),
                  );
                },
                child: const Text('Join Room'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightBlue[900],
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  selectedIndex: _selectedIndex,
                  currentUserID: _currentUserID,
                  onIndexChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({super.key});

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  String message = '';
  int rows = 0;
  int columns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Room'),
        backgroundColor: Colors.lightBlue[900],
          foregroundColor: Colors.white// Change AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'For better results, minimum 8 rows and 8 columns are recommended',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Message',
              ),
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Rows',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Columns',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  columns = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[900], // Change button color
                  foregroundColor: Colors.white, // Change text color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewRoomPage(
                        message: message,
                        rows: rows,
                        columns: columns,
                      ),
                    ),
                  );
                },
                child: const Text('Create Room'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JoinRoomPage extends StatefulWidget {
  const JoinRoomPage({super.key});

  @override
  _JoinRoomPageState createState() => _JoinRoomPageState();
}

class _JoinRoomPageState extends State<JoinRoomPage> {
  int rows = 0;
  int columns = 0;
  String ledString = '';

  @override
  void initState() {
    super.initState();
    fetchLedString();
  }

  Future<void> fetchLedString() async {
    try {
      // Fetch the led_string entity from Firestore
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('led_string').doc('entity_id').get();

      // Get the value of led_string from the document
      setState(() {
        ledString = documentSnapshot.get('led_string');
      });
    } catch (error) {
      print('Error fetching led_string: $error');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Room'),
        backgroundColor: Colors.lightBlue[900],
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LED String: $ledString', // Display the fetched led_string
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Rows',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  rows = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Columns',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  columns = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[900], // Change button color
                  foregroundColor: Colors.white, // Change text color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinedRoomPage(
                        rows: rows,
                        columns: columns,
                      ),
                    ),
                  );
                },
                child: const Text('Join Room'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
