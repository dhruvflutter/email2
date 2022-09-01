import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  List l = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("contactbook");

    DatabaseEvent de = await ref.once();

    DataSnapshot ds = de.snapshot;

    print(ds.value);

    Map map = ds.value as Map;

    map.forEach((key, value) {
      l.add(value);
    });

    setState(() {
      print(l);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: l.length > 0
          ? ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          Map m = l[index];
          return ListTile(
            title: Text("${m['name']}"),
            subtitle: Text("${m['contact']}"),
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
