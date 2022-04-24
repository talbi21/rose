import 'package:finalrose/ui/Profile/information_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/content_model.dart';
import '../../theme.dart';

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

    return Container(
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: const [0.5, 0.5],
        colors: Theme.of(context).brightness == Brightness.light
            ? [Colors.blueAccent, Colors.transparent]
            : [const Color(0xFF121212), Colors.transparent],
      )),
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(padding: EdgeInsets.all(0)),
          InkWell(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const InformationPage();
              }))
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                  child: CircleAvatar(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("Assets/img/avatar.png"))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Achref Talbi',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text('Admin',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal))
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
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
                          const SizedBox(
                            width: 20,
                          ),
                          Text(element['title'],
                              style: const TextStyle(
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
              const SizedBox(
                width: 10,
              ),
              const InkWell(
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer<ThemeProvider>(builder: (context, provider, child) {
                return Switch.adaptive(
                  value: Theme.of(context).brightness == Brightness.light
                      ? false
                      : true,
                  onChanged: (value) {
                    isLight = !isLight;
                    provider.changeTheme(isLight ? 'dark' : 'light');
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
