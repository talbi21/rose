import "dart:convert";

import 'package:finalrose/Service/urls.dart';
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
  var _currentDeviceJson = "";
  late String? _functionName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pairing device")),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Button name"),
                onChanged: (String? value) {
                  _functionName = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _labelCodePower =
                          "Press the " + _functionName! + " on the remote";
                    });

                    Map<String, String> headers = {
                      "Content-Type": "application/json"
                    };
                    Map<String, String> body = {
                      "device_id": widget._deviceId,
                      "function": _functionName!,
                    };

                    http
                        .post(
                            Uri.parse(
                                URLS.baseUrl6000 + "/devices/pair-device"),
                            headers: headers,
                            body: jsonEncode(body))
                        .then((http.Response response) async {
                      setState(() {
                        Navigator.pop(context);
                      });
                    });
                  },
                  child: const Text("Map button"),
                ),
              ),
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
    );
  }
}
