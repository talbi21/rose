import 'dart:convert';

import 'package:finalrose/Service/urls.dart';
import 'package:finalrose/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PairDevice extends StatefulWidget {
  final String _deviceId;

  const PairDevice(this._deviceId);

  @override
  _PairDeviceState createState() => _PairDeviceState();
}

class _PairDeviceState extends State<PairDevice> {
  var _labelCodePower = "";
  final _currentDeviceJson = "";
  late final String? _functionName = "";
  late TextEditingController _functionNameController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    _functionNameController.dispose();
    super.dispose();
  }

  void initData() {
    _functionNameController = TextEditingController(text: "");
  }

  void mapButton() {
    setState(() {
      _labelCodePower = "Press the " + _functionName! + " on the remote";
    });

    Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, String> body = {
      "device_id": widget._deviceId,
      "function": _functionName!,
    };

    http
        .post(Uri.parse(URLS.baseUrl6000 + "/devices/pair-device"),
            headers: headers, body: jsonEncode(body))
        .then((http.Response response) async {
      setState(() {
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pairing device")),
      body: Form(
        key: _keyForm,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(25),
                child: const Text(
                  "Point your remote to the infrared receiver and when you are ready, tap the map remote button, then "
                  "tap the button on your remote",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormFrave(
                  controller: _functionNameController,
                  hintText: 'Type the function name',
                  prefixIcon: const Icon(Icons.smart_button),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 300,
                child: SizedBox(
                    child: ElevatedButton(
                  onPressed: () => {
                    if (_keyForm.currentState!.validate()) {mapButton()}
                  },
                  child: const Text("Map remote button"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(_labelCodePower)),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      _currentDeviceJson,
                      style: const TextStyle(fontSize: 25),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
