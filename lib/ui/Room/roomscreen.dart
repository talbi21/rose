import 'dart:math';

import 'package:finalrose/ui/Home/home_page.dart';
import 'package:finalrose/ui/Profile/profile_page.dart';
import 'package:flutter/material.dart';



import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Data/content_model.dart';
import '../../Helpers/helpers.dart';
import '../Camera/camerascreen.dart';
import '../SmartLight/lampescreen.dart';
import '../SmartLight/lightscreen.dart';


class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color.fromRGBO(20,21,23, 1),

        elevation: 0,
        foregroundColor: Theme.of(context).brightness == Brightness.light
            ? Color.fromRGBO(20,21,23, 1)
            : Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: BoxDecoration(

            color:Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Color.fromRGBO(20,21,23, 1)

        ),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Room',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.light
                          ?Color.fromRGBO(20,21,23, 1)
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
                    style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.light
                        ?Color.fromRGBO(20,21,23, 1)
                        : Colors.grey,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(

                  height: MediaQuery.of(context).size.height * 0.11,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 3, itemBuilder: (context, index) {
                    return _maindeviceBuilder(devicesA[index+3] );
                  }),
                ),
                Container(

                  height: MediaQuery.of(context).size.height * 0.11,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, itemBuilder: (context, index) {
                    return _maindeviceBuilder(devicesA[index] );
                  }),
                ),

              ],
            ),
            SizedBox(height: 20
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    "Devices",
                    style: TextStyle(fontSize: 15, color:Theme.of(context).brightness == Brightness.light
                        ?Color.fromRGBO(20,21,23, 1)
                        : Colors.grey,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 25,right: 25,bottom: 40),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: devicesA.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  _deviceBuilder(devicesA[index]);
                  }
              ),
            ),
            ),






          ],
        ),
      ),
    );


  }
  Widget _maindeviceBuilder(mainDevicesModel item) {
    List colorsD = [Color.fromRGBO(87, 75, 47, 1),Color.fromRGBO(49, 63, 87, 1),Color.fromRGBO(121, 49, 51, 1),Color.fromRGBO(50, 68, 56, 1)];
    List colorsL = [Color.fromRGBO(143, 214, 233, 1),Color.fromRGBO(113, 59, 181, 1),
      Color.fromRGBO(255, 0, 0, 0.7),Color.fromRGBO(0, 94, 255, 1),Color.fromRGBO(37, 189, 88, 0.85),Color.fromRGBO(113, 59, 181,1)];
    Random random = new Random();
    int i =random.nextInt(3);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 50,
        width:165,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),

          color: Theme.of(context).brightness == Brightness.light
              ? colorsL[i]
              : colorsD[i],
        ),
        child: MaterialButton(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Icon(Icons.highlight
                ),
                Text(
                    item.name
                ),

              ]
          ),
          onPressed: () {
            Navigator.push(context, routeSlide(page: LampeScreen()));
          },
          textColor: Colors.grey,

        ),

      ),
    );
  }
  Widget _deviceBuilder(mainDevicesModel item) {
    return Container(

      decoration: BoxDecoration(

        color:
        Theme.of(context).brightness == Brightness.light
            ?Colors.grey
            :Color.fromRGBO(42,43,46,1.0),
        shape: BoxShape.rectangle,
        borderRadius:  BorderRadius.circular(20),
      ),

      child: MaterialButton(
        child: Image.asset(

          item.label,
height: 100,
          width: 100,



        ),
        onPressed: () {
          Navigator.push(context, routeSlide(page: CameraScreen()));
        },
        textColor: Colors.white,

      ),

    );
  }
}
