import 'dart:convert';

import 'package:finalrose/Data/content_model.dart';
import 'package:finalrose/Service/urls.dart';
import 'package:finalrose/ui/Device/pair_device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowDevice extends StatefulWidget {
  final String _id;
  final String _name;
  final String _type;
  final List<InfraredCode> _infraredCodes;

  const ShowDevice(this._id, this._name, this._type, this._infraredCodes);

  @override
  _ShowDeviceState createState() => _ShowDeviceState();
}

class _ShowDeviceState extends State<ShowDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._name),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Card(
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Name : " + widget._name)),
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text("Type : " + widget._type)),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: const Text("Add new functions"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return PairDevice(widget._id);
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 350,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemCount: widget._infraredCodes.length,
                itemBuilder: (context, int index) {
                  Icon icon;
                  if (index == 0) {
                    icon = const Icon(Icons.power_settings_new, size: 60);
                  } else if (index == 1) {
                    icon = const Icon(Icons.volume_off, size: 60);
                  } else if (index == 1) {
                    icon = const Icon(Icons.volume_mute, size: 60);
                  } else {
                    icon = const Icon(Icons.volume_up, size: 60);
                  }
                  return _buttonBuilder(
                      widget._infraredCodes[index].function, icon);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buttonBuilder(String function, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(150, 150, 150, 0.7),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: icon,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  function,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          Map<String, String> headers = {"Content-Type": "application/json"};
          Map<String, String> body = {
            "device_id": widget._id,
            "function": function,
          };

          http.post(Uri.parse(URLS.baseUrl3000 + "/devices/send-ir-code"),
                  headers: headers, body: jsonEncode(body))
              .then((http.Response response) async {});
        },
        textColor: Colors.white,
      ),
    );
  }
}
