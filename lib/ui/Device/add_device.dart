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
  late String? _type = "TV";

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
              margin: const EdgeInsets.all(30),
              child: const Icon(Icons.devices_rounded, size: 150),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: DropdownButton<String>(
                value: _type,
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _type = newValue!;
                  });
                },
                items: <String>[
                  'TV',
                  'Climatiseur',
                  'Projecteur',
                  'Haut-parleur'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                      .post(Uri.parse(URLS.baseUrl6000 + "/devices/one"),
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
