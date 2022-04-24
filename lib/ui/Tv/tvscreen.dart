import 'package:flutter/material.dart';

import '../../Data/content_model.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  _TvScreenState createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  double minutes = 0;
  double volume = 0;
  bool playing = false;

  int j = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Color.fromRGBO(20, 21, 23, 1),
        elevation: 0,
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
                    'TV',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromRGBO(20, 21, 23, 1)
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  films[j].label,
                  height: 200,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Text(
                        films[0].name + ' | Season ' + films[0].Season,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Episode num/episode name ",
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.grey,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black12
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color.fromRGBO(20, 21, 23, 1)
                          : Colors.black54,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 40),
            Column(children: [
              Container(
                width: size.width,
                child: Slider.adaptive(
                    activeColor: Color.fromRGBO(66, 133, 244, 1),
                    inactiveColor: Colors.grey[350],
                    value: minutes,
                    max: 60,
                    onChanged: (value) {
                      setState(() {
                        minutes = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(minutes.toStringAsFixed(2)),
                    Text((60 - minutes).toStringAsFixed(2)),
                  ],
                ),
              )
            ]),
            SizedBox(
              height: 10,
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
                    color: Theme.of(context).brightness == Brightness.light
                        ? Color.fromRGBO(20, 21, 23, 1)
                        : Colors.white,
                  ),
                ),
                Icon(
                  Icons.skip_next,
                  semanticLabel: 'Next?',
                  size: 50,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Color.fromRGBO(20, 21, 23, 1)
                      : Colors.white,
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(children: [
                Icon(
                  Icons.volume_down,
                  size: 50,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Color.fromRGBO(20, 21, 23, 1)
                      : Colors.white,
                ),
                Container(
                  width: size.width - 100,
                  child: Slider.adaptive(
                      activeColor: Color.fromRGBO(66, 133, 244, 1),
                      inactiveColor: Colors.grey[350],
                      value: volume,
                      max: 10,
                      onChanged: (value) {
                        setState(() {
                          volume = value;
                        });
                      }),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
