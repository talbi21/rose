import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/content_model.dart';
import '../../theme.dart';
import '../Profile/widgets/divider_line.dart';



class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
   // isLight = Theme.of(context).brightness == Brightness.light
   //     ? true
   //     :false;

    final size = MediaQuery.of(context).size;
    final text = MediaQuery

        .of(context)
        .platformBrightness == Brightness.light
        ? 'Light Mode' : 'Dark Mode';
    return Container(
      height: size.height,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
            stops: [0.5,0.5],
            colors:


            Theme.of(context).brightness == Brightness.light
                ? [
              Colors.blueAccent,
              Colors.transparent

            ]
                : [Color(0xFF121212),  Colors.transparent],

          )),
      padding: EdgeInsets.only(top: 30, bottom: 20, left: 10),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achref Talbi',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text('User',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)
                  )

                ],
              ),
            ],

          ),


          Column(
            children: drawerItems
                .map((element) =>
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => element['screen']));
                        },
                        child: Icon(
                          element['icon'],
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(element['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                    ],
                  ),
                ))
                .toList(),
          ),
          Row(
            children: [



              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
                Consumer<ThemeProvider>(builder: (context, provider, child) {
                  return Switch.adaptive(
                      value: Theme.of(context).brightness == Brightness.light
                           ? false
                          :true ,
                onChanged: (value) {
                        isLight = !isLight;
                        provider.changeTheme(
                            isLight? 'dark' :'light'
                  );



                },
              );
  }),
            ],
          )
        ],
      ),
    );
  }
}


