import 'dart:math';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Bloc/General/general_bloc.dart';
import '../../Bloc/user/user_bloc.dart';
import '../../Data/content_model.dart';
import '../../Helpers/helpers.dart';
import '../../Service/urls.dart';
import '../../theme.dart';
import '../Profile/add_product/add_product_page.dart';
import '../Profile/profile_page.dart';
import '../themes/colors_frave.dart';
import '../widgets/widgets.dart';
import 'drawerscreen.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);




  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'HOME1';

  late ScrollController _scrollControllerHome;
  double scrollPrevious = 0;

  @override
  void initState() {

    _scrollControllerHome = ScrollController();
    _scrollControllerHome.addListener(addListenerMenu);
    super.initState();
  }

  void addListenerMenu(){

    if( _scrollControllerHome.offset > scrollPrevious ){
      BlocProvider.of<GeneralBloc>(context).add( OnShowOrHideMenuEvent(showMenu: false));
    } else {
      BlocProvider.of<GeneralBloc>(context).add( OnShowOrHideMenuEvent(showMenu: true));
    }

    scrollPrevious = _scrollControllerHome.offset;

  }

  @override
  void dispose() {
    _scrollControllerHome.removeListener(addListenerMenu);
    _scrollControllerHome.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isLight = true;
    final size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Color.fromRGBO(20,21,23, 1),

        elevation: 0,
        foregroundColor: Theme.of(context).brightness == Brightness.light
          ? Color.fromRGBO(20,21,23, 1)
          : Colors.white,
        automaticallyImplyLeading: true,

        /*
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeft(
              child: BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state)
                  => state.user != null
                      ? Row(
                    children: [
                      state.user!.pictureId != ''
                          ? CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(URLS.baseUrl + state.user!.pictureId),
                      )
                          : CircleAvatar(
                        child: TextFrave(text: state.user!.firstName.substring(0,2).toUpperCase(), fontWeight: FontWeight.bold, color: Colors.white,),
                        radius: 20,
                        backgroundColor: ColorsFrave.primaryColorFrave,
                      ),
                      const SizedBox(width: 5.0),
                      TextFrave(text: state.user!.firstName, fontSize: 18,)
                    ],
                  )
                      : CircleAvatar(
                    radius: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset('assets/img.png',
                     ),
                   ),
                  )

              ),
            ),
            InkWell(

              onTap: () => Navigator.of(context).pushAndRemoveUntil(routeSlide(page: ProfilePage()), (_) => false),
              child: Stack(
                children: [
                  FadeInRight(
                      child: Container(
                          margin: EdgeInsets.symmetric( horizontal: 10,vertical: 10),
                          width: 32,
                          child:  IconButton(
                            color:Theme.of(context).brightness == Brightness.light
                              ? Color.fromRGBO(20,21,23, 1)
                              :Colors.white ,

                            iconSize: 40,
                            icon: Icon(Icons.settings),
                            onPressed: () {
                             // Navigator.of(context).pushAndRemoveUntil(routeSlide(page: ProfilePage()), (_) => false);
                             // Navigator.of(context).pushReplacement(routeSlide(page: ProfilePage()));
                              Navigator.push(context, routeSlide(page: ProfilePage()));
                            },
                          )
                      )
                  ),

                ],
              ),
            )
          ],
        ),



         */
      ),
      drawer:
      DrawerScreen(),
      body: Stack(
        children: [Container(
          decoration: BoxDecoration(

            color:Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Color.fromRGBO(20,21,23, 1)

          ),
          child: Column(
            children: [

              SizedBox(height: 10),

                 Container(
                  margin: EdgeInsets.symmetric( horizontal: 30,vertical: 20),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      DropdownButton<String>(
                        value: dropdownValue,
                        items: [
                          //Light, dark, and system
                          DropdownMenuItem<String>(
                            value: 'HOME1',
                            child: Text(
                              'Home1',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color:Theme.of(context).brightness == Brightness.light
                                      ?Color.fromRGBO(20,21,23, 1)
                                      : Colors.white


                              ),
                            ),
                          ),

                          DropdownMenuItem<String>(
                            value: 'HOME2',
                            child: Text(
                              'Home2',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color:Theme.of(context).brightness == Brightness.light
                                      ?Color.fromRGBO(20,21,23, 1)
                                      : Colors.white


                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: 'HOME3',
                            child: Text(
                              'Villa k6',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color:Theme.of(context).brightness == Brightness.light
                                      ?Color.fromRGBO(20,21,23, 1)
                                      : Colors.white


                              ),
                            ),
                          ),
                        ],


                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });

                        },
                      ),

                      IconButton(
                        color: Theme.of(context).brightness == Brightness.light
                            ?Color.fromRGBO(20,21,23, 1)
                            : Colors.white,
                        iconSize: 40,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(context, routeSlide(page: AddProductPage()));

                        },
                      )


                      /*
                      Icon(Icons.add,
                        color: Colors.white,
                        size: 30,
                      )

                       */
                    ],
                  ),
                ),

              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 40,left: 30,right: 30),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,


                    ),
                    itemCount: hotels.length,

                    itemBuilder: (BuildContext context, int index) {
                      return  _roomsBuilder(hotels[index]);
                    }
                ),
              ),
              ),
            ],
          ),
        ),

    ]
      ),
      
    );
  }





  Widget _roomsBuilder(QuantHotelModel item) {

    List colorsD = [Color.fromRGBO(87, 75, 47, 1),Color.fromRGBO(49, 63, 87, 1),
      Color.fromRGBO(121, 49, 51, 1),Color.fromRGBO(50, 68, 56, 1),Color.fromRGBO(51, 75, 82, 1),Color.fromRGBO(113, 59, 181, 0.5)];
    List colorsL = [Color.fromRGBO(143, 214, 233, 1),Color.fromRGBO(113, 59, 181, 1),
      Color.fromRGBO(255, 0, 0, 0.7),Color.fromRGBO(0, 94, 255, 1),Color.fromRGBO(37, 189, 88, 0.85),Color.fromRGBO(113, 59, 181,1)];
    Random random = new Random();
    int i =random.nextInt(6);



    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => item.Route));
      },
      child: Container(

        decoration: BoxDecoration(

          color: Theme.of(context).brightness == Brightness.light
              ? colorsL[i]
              : colorsD[i],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(

          children:[ Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top :10),
                child: Icon(item.Icon,
                color: Colors.white
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(item.name,
                style: TextStyle(
                  color: Colors.white
                )
                ),
              )

            ],
          )],
        ),



      )
    );

  }
}
