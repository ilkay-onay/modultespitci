import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'HakkimizdaPage.dart';
import 'YardimPage.dart';
import 'AyarlarPage.dart';
import 'BagisPage.dart';
import 'hivemq.dart';
import 'dart:async'; 
import 'dart:typed_data';
import 'dart:convert';

final service = FlutterBackgroundService();
  String defaultPicture = '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';
  Uint8List decodedImage = base64Decode(defaultPicture);
  bool isRaspiConnected = false;
  bool isAlarmActive = false;
  bool isFallDetected = false;
  MQTTClientWrapper newclient = new MQTTClientWrapper();

void main() {
  newclient.prepareMqttClient();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer; // Declare timer variable

  @override
  void initState() {
    super.initState();
    // Start a timer that runs every 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      // Check if isFallDetected is true
      if (isFallDetected || isRaspiConnected || isAlarmActive) {
        // Force the screen to redraw
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ModülTespitçi Versiyon 0.1'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF64B5F6),
                Color(0xFFE8F5E9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF64B5F6),
                    Color(0xFFE8F5E9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text('Seçenekler'),
            ),
            ListTile(
              title: Text('Hakkımızda'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HakkimizdaPage()));
              },
            ),
            ListTile(
              title: Text('Yardım'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => YardimPage()));
              },
            ),
            ListTile(
              title: Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AyarlarPage()));
              },
            ),
            ListTile(
              title: Text('Bağış'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => BagisPage()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        isRaspiConnected ? 'Tespit sistemine bağlanıldı' : 'Tespit sistemine bağlanılamadı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: isRaspiConnected ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset(
                        isRaspiConnected
                            ? 'assets/color_raspi.png'
                            : 'assets/black_white_raspi.png',
                        width: 50.0,
                        height: 65.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      isAlarmActive ? 'Alarm Çalışıyor' : 'Alarm Çalışmıyor',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: isAlarmActive ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      value: isAlarmActive,
                      onChanged: (value) {
                        setState(() {
                          isAlarmActive = value;
                          newclient.publishMessage('ackapa');
                        });
                      },
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                    ),
                  ),
                ],
              ),
Expanded(
 child: Padding(
  padding: const EdgeInsets.only(bottom: 20.0),
  child: Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    child: Stack(
      children: [
        Image.memory(
          decodedImage,
          fit: BoxFit.contain,
        ),
        Visibility(
          visible: isFallDetected,
          child: Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Row(
              children: [
                Image.asset(
                  'assets/danger.png',
                  width: 30.0,
                  height: 30.0,
                ),
                SizedBox(width: 5.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.black.withOpacity(0.7),
                  child: Text(
                    'Düşme tespit edildi!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
),

),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        newclient.publishMessage('foto');
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(200, 60)),
                    ),
                    child: Text('Fotoğraf Çek', 
                    style: TextStyle(fontSize: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
