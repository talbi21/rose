import 'dart:convert';
import 'dart:math';

import 'package:finalrose/Service/urls.dart';
import 'package:finalrose/ui/Device/add_device.dart';
import 'package:finalrose/ui/Device/show_device.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Data/content_model.dart';
import '../../Helpers/helpers.dart';
import '../SmartLight/lampescreen.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final List<Device> _devices = [];

  late Future<bool> fetchedData;

  Future<bool> fetchData() async {
    http.Response response =
        await http.get(Uri.parse(URLS.baseUrl3000 + "/devices/all"));

    List<dynamic> devicesFromServer = json.decode(response.body)["devices"];
    for (var i = 0; i < devicesFromServer.length; i++) {
      _devices.add(Device(
          devicesFromServer[i]["_id"],
          devicesFromServer[i]["name"],
          devicesFromServer[i]["type"],
          makeInfraredCodes(devicesFromServer[i]["infraredCodes"])));
    }
    return true;
  }

  List<InfraredCode> makeInfraredCodes(List<dynamic> jsonItem) {
    List<InfraredCode> _infraredCodes = [];
    for (var i = 0; i < jsonItem.length; i++) {
      _infraredCodes.add(InfraredCode(
          jsonItem[i]["_id"], jsonItem[i]["function"], jsonItem[i]["value"]));
    }
    return _infraredCodes;
  }

  @override
  void initState() {
    fetchedData = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color.fromRGBO(20, 21, 23, 1),
        elevation: 0,
        foregroundColor: Theme.of(context).brightness == Brightness.light
            ? Color.fromRGBO(20, 21, 23, 1)
            : Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Color.fromRGBO(20, 21, 23, 1)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Room',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromRGBO(20, 21, 23, 1)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    "Quick access",
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _maindeviceBuilder(devicesA[index + 3]);
                      }),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _maindeviceBuilder(devicesA[index]);
                      }),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Device",
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: MaterialButton(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.add),
                            Text("Add new device"),
                          ]),
                      onPressed: () {
                        Navigator.push(
                            context, routeSlide(page: const AddDevice()));
                      },
                      textColor: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 25, right: 25, bottom: 40),
                child: FutureBuilder(
                    future: fetchedData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.1,
                            ),
                            itemCount: _devices.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _deviceBuilder(_devices[index]);
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _maindeviceBuilder(mainDevicesModel item) {
    List colorsD = [
      Color.fromRGBO(87, 75, 47, 1),
      Color.fromRGBO(49, 63, 87, 1),
      Color.fromRGBO(121, 49, 51, 1),
      Color.fromRGBO(50, 68, 56, 1)
    ];
    List colorsL = [
      Color.fromRGBO(143, 214, 233, 1),
      Color.fromRGBO(113, 59, 181, 1),
      Color.fromRGBO(255, 0, 0, 0.7),
      Color.fromRGBO(0, 94, 255, 1),
      Color.fromRGBO(37, 189, 88, 0.85),
      Color.fromRGBO(113, 59, 181, 1)
    ];
    Random random = new Random();
    int i = random.nextInt(3);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 50,
        width: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).brightness == Brightness.light
              ? colorsL[i]
              : colorsD[i],
        ),
        child: MaterialButton(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(Icons.highlight),
            Text(item.name),
          ]),
          onPressed: () {
            Navigator.push(context, routeSlide(page: LampeScreen()));
          },
          textColor: Colors.grey,
        ),
      ),
    );
  }

  Widget _deviceBuilder(Device item) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey
            : const Color.fromRGBO(42, 43, 46, 1.0),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.devices_outlined),
            Text(item.name),
            Text(
              item.type,
              style: const TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ShowDevice(
                item.id, item.name, item.type, item.infraredCodes);
          }));
        },
        textColor: Colors.white,
      ),
    );
  }
}
