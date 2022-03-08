import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Adiciona a referencia do DB
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final valueDB = database.child("valuesDB/");
    final otherValue = database.child("someOtherValue/");

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Study"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Exemplos: "),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.call_received),
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () async {
              //await valueDB.update({
              //  "value": "20"
              //});

              await otherValue.set({
                "value": "50000",
                "description":"Sent from App",
              }).then((value) => print("Sent to the DB"))
                  .catchError((error) => print("Error to connect, $error"));

              await valueDB.update({
                "value": "10",
                "description":"Sent from App"
              }).then((value) => print("Sent to the DB"))
                  .catchError((error) => print("Error to connect, $error"));
            },
            child: Icon(Icons.send_to_mobile),
          ),
        ],
      ),
    );
  }
}
