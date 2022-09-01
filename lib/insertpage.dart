import 'package:email2/viewpage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class insertpage extends StatefulWidget {
  const insertpage({Key? key}) : super(key: key);

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {

  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return viewpage();
        },));
      },),
      appBar: AppBar(title: Text("RealTime Database"),),
      body: Column(
        children: [
          TextField(controller: tname),
          TextField(controller: tcontact),
          
          ElevatedButton(onPressed: () {


            DatabaseReference ref = FirebaseDatabase.instance.ref("contactbook").push();
            String? userid = ref.key;
            String name = tname.text;
            String contact = tcontact.text;

            Map m = {"userid":userid,"name":name,"contact":contact};
            ref.set(m);

          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
