import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LampeScreen extends StatefulWidget {
  const LampeScreen({Key? key}) : super(key: key);

  @override
  _LampeScreenState createState() => _LampeScreenState();
}

class _LampeScreenState extends State<LampeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(20, 21, 23, 1)),
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
                    'Lampe',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      trackColor: Color.fromRGBO(202, 138, 42, 1),
                      hideShadow: true,
                      trackGradientStartAngle: 200,
                      progressBarColor: Color.fromRGBO(202, 138, 42, 1),
                      dotColor: Color.fromRGBO(202, 138, 42, 1),
                      dynamicGradient: false,
                    ),
                    counterClockwise: false,
                    angleRange: 250,
                    size: 300.00,
                    infoProperties: InfoProperties(
                      mainLabelStyle:
                          TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  initialValue: 0,
                  onChange: (double value) {},
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(202, 138, 42, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(Icons.wb_incandescent_sharp,
                        color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    "Change Color",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return _deviceBuilder();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SwitchButtonBuilder() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.red,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  Widget _deviceBuilder() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(42, 43, 46, 1.0),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        child: Container(
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        onPressed: () {},
        textColor: Colors.white,
      ),
    );
  }
}
