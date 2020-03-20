import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void setValues() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('user_name', 'vikalp');
    sharedPrefs.setString('user_id', '117');
    sharedPrefs.setString('notification_prefs', 'on');
    print('Value added');
  }

  void getValues() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String userName = sharedPrefs.getString('user_name');
    String userId = sharedPrefs.getString('user_id');
    String notificationPrefs = sharedPrefs.getString('notification_prefs');
    print('user_name: $userName');
    print('user_id: $userId');
    print('notification_prefs: $notificationPrefs');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference in Flutter'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text('Set Values'),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () async {
                  setValues();
                },
              ),
            ),
            Container(
              child: RaisedButton(
                child: Text('Get Values'),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () async {
                  getValues();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
