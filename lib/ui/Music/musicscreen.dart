import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Data/content_model.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double minutes = 0;
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color.fromRGBO(20, 21, 23, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                    'Music',
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
              padding: const EdgeInsets.only(left: 20, bottom: 8.0, top: 20),
              child: Center(
                child: Column(children: [
                  CircleAvatar(
                    minRadius: 150,
                    backgroundImage: AssetImage(songs[0].label),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    songs[0].name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    songs[0].author,
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.skip_previous,
                        size: 50,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.white,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            playing = !playing;
                          });
                        },
                        child: Icon(
                          playing ? Icons.pause : Icons.play_arrow,
                          semanticLabel: playing ? 'Play' : 'Pause',
                          size: 50,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Color.fromRGBO(20, 21, 23, 1)
                                  : Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.skip_next,
                        size: 50,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Color.fromRGBO(20, 21, 23, 1)
                            : Colors.white,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Container(
              width: 300.0,
              child: Slider.adaptive(
                  activeColor: Color.fromRGBO(66, 133, 244, 1),
                  inactiveColor: Colors.grey[350],
                  value: minutes,
                  max: 3600,
                  onChanged: (value) {
                    setState(() {
                      minutes = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
