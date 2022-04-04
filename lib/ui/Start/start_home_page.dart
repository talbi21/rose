
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class StartHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;
    
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            radius: 0.4,
            colors: Theme.of(context).brightness == Brightness.light
                ? [
              Colors.white,
              Colors.blueAccent
            ]
                : [
              const Color(0xE6600D51).withOpacity(1),
              const Color(0xFF121212),


            ],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('Assets/img/logo1.png')
                              )
                            )
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'RO',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(245, 48, 111, 1.0),
                                ),
                              ),
                              Text(
                                'SE',
                                style: TextStyle(
                                  fontSize: 38.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Make home a better place',
                            style: TextStyle(
                              color:Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          BtnFrave(
                            text: 'Sign Up with Email ID',
                            colorText: Colors.white,
                              backgroundColor: Color(0xFF2A2B2E),
                            onPressed: () => Navigator.of(context).pushNamed('signUpPage'),
                            width: size.width
                          ),
                          SizedBox(height: 15.0),
                          BtnFrave(
                            text: 'Sign Up with Google',
                            colorText: Colors.white,
                            backgroundColor: Color(0xFF2A2B2E),
                            width: size.width
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFrave(text: 'Already have an account?', fontSize: 17, color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,),
                              TextButton(
                                child: TextFrave(text: 'Sign In', fontSize: 18, fontWeight: FontWeight.bold, color:  Color(0xff0C6CF2)),
                                onPressed: () => Navigator.of(context).pushNamed('signInPage'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}