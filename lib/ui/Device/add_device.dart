import 'dart:convert';

import 'package:finalrose/Service/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDevice extends StatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  late String? _name = "";
  late String? _type = "";

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
                onSaved: (String? value) {
                  _name = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Type"),
                onSaved: (String? value) {
                  _type = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text("Add"),
                onPressed: () {

                  Map<String, String> headers = {
                    "Content-Type": "application/json"
                  };

                  Map<String, String> body = {
                    "name": _name!,
                    "type": _type!,
                  };

                  http
                      .post(Uri.parse(URLS.baseUrl3000 + "/devices/one"),
                          headers: headers, body: jsonEncode(body))
                      .then((value) => {Navigator.pop(context)});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
