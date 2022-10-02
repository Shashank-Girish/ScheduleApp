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
        title: Text("Events"),
        backgroundColor: Colors.orange[600],
      ),
      backgroundColor: Colors.orange[100],
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
            onPressed: (){
              setState(() {
                Navigator.pushNamed(context, "/input");
              });
            },
          child: Text("Add new Event"))
          ],

        ),
      )
    );
  }
}
