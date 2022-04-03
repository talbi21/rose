import 'dart:math';


import 'package:flutter/material.dart';


import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';


import '../../Data/content_model.dart';
import '../../Helpers/helpers.dart';
import '../Home/home_page.dart';




class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);


  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int j =0;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color.fromRGBO(20,21,23, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          color:Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white ,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                  Text('Choose a camera',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ?Color.fromRGBO(20,21,23, 1)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 10),
              child: FullScreenWidget(
                child: Container(
                  child: Image.asset(

                    videos[j].image,
                    height: 250,
                  ),


                ),
              ),
            ),


            Column(
                children: []
            ),
            SizedBox(height: 20
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Row(
                children: [
                  Text(
                    "Cameras",
                    style: TextStyle(fontSize: 20, color: Theme.of(context).brightness == Brightness.light
                        ?Color.fromRGBO(20,21,23, 1)
                        : Colors.white,
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  _deviceBuilder(videos[index], index);
                  }
              ),
            ),
            ),






          ],
        ),
      ),
    );


  }

  Widget _deviceBuilder(Cameras item,int index) {
    return GestureDetector(



      onTap: () {
        setState(() {
          j=index;
        });

      },
      child: Container(

        child: Image.asset(

          videos[index].image,
          height: double.infinity,
          width: double.infinity,
        ),
      ),

    );
  }
}
