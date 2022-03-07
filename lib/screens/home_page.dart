import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Study"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Center(
            child: Text("Exemplos"),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.call_received),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.send_to_mobile),
          ),
        ],
      ),
    );
  }
}
