import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';




class Lighscreen extends StatefulWidget {
  const Lighscreen({Key? key}) : super(key: key);

  @override
  _LighscreenState createState() => _LighscreenState();
}

class _LighscreenState extends State<Lighscreen> {
  late  MediaQueryData? _mediaQueryData =MediaQuery.of(context);
  bool lighton = false;
  bool isSelected = false;
  final List<bool> isSelectedd = [true, false];
  double Intensity =56;


  PanelController pc = new PanelController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:40 / 585 * _mediaQueryData!.size.height,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_outlined)),
                        Stack(
                          children: [
                            Text(
                              'Living\nRoom',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                fontSize: 45,
                                color: Color(0xFFBDBDBD).withOpacity(0.5),
                              ),
                            ),
                            Text(
                              'Living\nRoom',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26 / 585 * _mediaQueryData!.size.height,
                        ),
                        Text(
                          'Power',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height:4 / 585 * _mediaQueryData!.size.height,
                        ),
                        Switch.adaptive(
                          inactiveThumbColor: Color(0xFFE4E4E4),
                          inactiveTrackColor: Colors.white,
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xFF464646),
                          value: lighton,
                          onChanged: (value) {
                            setState(() {
                              lighton = !lighton;
                            });
                          },
                        ),
                        SizedBox(
                          height:20 / 585 * _mediaQueryData!.size.height,
                        ),
                        Text(
                          'Color',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height:7 / 585 * _mediaQueryData!.size.height,
                        ),
                        InkWell(
                          onTap:(){ pc.open();},
                          child: Image.asset(
                            'assets/color_wheel.png',
                            height:22 / 585 * _mediaQueryData!.size.height,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40 / 585 * _mediaQueryData!.size.height
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/lamp.png',
                      height: 180 / 585 * _mediaQueryData!.size.height,
                      width: 140 / 270 * _mediaQueryData!.size.width,
                      fit: BoxFit.contain,
                    ),

                    ///todo: Position this image in correct manner
                    lighton
                        ? Image.asset(
                      'assets/purple.png',
                      height: 190 / 585 * _mediaQueryData!.size.height,
                      width: 140 / 270 * _mediaQueryData!.size.width,
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    )
                        : SizedBox(
                      height: 190/ 585 * _mediaQueryData!.size.height,
                      width:140 / 270 * _mediaQueryData!.size.width,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:15 / 270 * _mediaQueryData!.size.width
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 20 / 585 * _mediaQueryData!.size.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Intensity',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        '${Intensity.toInt()}%',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 5 / 585 * _mediaQueryData!.size.height,
                        thumbColor: Color(0xFF464646),
                        activeTrackColor: Color(0xFF464646),
                        inactiveTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8)),
                    child: Slider(
                      min: 0,
                      max: 100,
                      onChanged: (val) {
                        setState(() {
                          Intensity =val;
                        });
                      },
                      value: Intensity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Off',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        '100%',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}



