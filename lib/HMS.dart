import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HMSScreen extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setSharedInstance(true);
    await flutterTts.setLanguage("th-TH,en-EN");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json_file/HMS.json');
    final data = await json.decode(response);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/login.png', height: 40),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mic_rounded)),
            Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Firstname : Kamonwan',
                            style: TextStyle(fontSize: 13)),
                        SizedBox(width: 50),
                        Text('Lastname : Daengkla',
                            style: TextStyle(fontSize: 13))
                      ],
                    ),
                    Text('Birth of day : 21 March 2002',
                        style: TextStyle(fontSize: 13)),
                    Text('Dianosis : Heart Disease',
                        style: TextStyle(fontSize: 13)),
                    Text('Allergy : Paracetamol',
                        style: TextStyle(fontSize: 13))
                  ],
                )),
            IconButton(onPressed: () {}, icon: Icon(Icons.mic_rounded)),
            Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Firstname : Kamonwan',
                            style: TextStyle(fontSize: 13)),
                        SizedBox(width: 50),
                        Text('Lastname : Daengkla',
                            style: TextStyle(fontSize: 13))
                      ],
                    ),
                    Text('Birth of day : 21 March 2002',
                        style: TextStyle(fontSize: 13)),
                    Text('Dianosis : Heart Disease',
                        style: TextStyle(fontSize: 13)),
                    Text('Allergy : Paracetamol',
                        style: TextStyle(fontSize: 13))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
