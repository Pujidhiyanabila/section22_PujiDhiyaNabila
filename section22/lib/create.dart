import 'package:flutter/material.dart';
import 'package:section22/listview_page.dart';

class FlutterForm extends StatefulWidget {
  const FlutterForm({ Key? key }) : super(key: key);

  @override
  _FlutterFormState createState() => _FlutterFormState();
}

class _FlutterFormState extends State<FlutterForm> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create New Contact"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Input Nama",
                  labelText: "Nama",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),
                  border: OutlineInputBorder()
                ),
                obscureText: false,
                maxLength: 15,
                maxLines: 1,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Input Nomor Telepon",
                  labelText: "Nomor Telepon",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),
                  border: OutlineInputBorder()
                ),
                obscureText: false,
                maxLength: 15,
                maxLines: 1,
              ),
              ElevatedButton(
              onPressed: () {}, 
              child: const Text("Submit")
              ),
            ],
          ),
        ),
      ),
    );
  }
}