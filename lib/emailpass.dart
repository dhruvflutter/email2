import 'package:flutter/material.dart';

class emailpass extends StatefulWidget {
  const emailpass({Key? key}) : super(key: key);

  @override
  State<emailpass> createState() => _emailpassState();
}

class _emailpassState extends State<emailpass> {

  TextEditingController temail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email-Password"),),

      body: Column(
        children: [
          TextField(controller: temail)
        ],
      ),
    );
  }
}
