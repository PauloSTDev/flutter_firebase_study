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
  final _database = FirebaseDatabase.instance.reference();

  /**Inicia setState para renderização
  @override
  void initState() {
    super initState();
    _activateListeners();
  }
  void _ac**/



  @override
  Widget build(BuildContext context) {
    //Referencias/Paths do banco
    final valueDB = _database.child("valuesDB/");
    final otherValue = _database.child("someOtherValue/");

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Study"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.yellow,
                ),
                onPressed: () async {
                  //await valueDB.update({
                  //  "value": "20"
                  //});
                  await otherValue
                      .update({
                    "value": "99999",
                    "description": "Updated from App",
                    "detailsUpdate":"Atualiza campos existentes e cria caso não exista ainda"
                  })
                      .then((value) => print("Update OtherValue"))
                      .catchError((error) => print("Error to connect, $error"));

                  await valueDB
                      .update({"value": "999", "description": "Updated from App"})
                      .then((value) => print("Update valueDB"))
                      .catchError((error) => print("Error to connect, $error"));
                },
                child: Row(
                  children: [
                    Icon(Icons.send_to_mobile),
                    Text(
                      "Update",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.yellow,
                ),
                onPressed: () async {
                  await otherValue
                      .set({
                    "value": "50000",
                    "description": "Sent from App",
                    "detailsSet":"Define/Seta a base dados com o que está sendo enviado, ignora chaves e valores que existiam antes."
                  })
                      .then((value) => print("Set OtherValue"))
                      .catchError((error) => print("Error to connect, $error"));

                  await valueDB
                      .set({"value": "10", "description": "Sent from App"})
                      .then((value) => print("Set ValueDB"))
                      .catchError((error) => print("Error to connect, $error"));
                },
                child: Row(
                  children: [
                    Icon(Icons.send_to_mobile),
                    Text(
                      "Set",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            },
            child: Icon(Icons.send_to_mobile),
          ),
        ],
      ),
    );
  }
}
