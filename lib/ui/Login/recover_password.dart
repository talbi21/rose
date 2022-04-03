import 'dart:ui';
import 'package:finalrose/ui/Login/verify_pass.dart';
import 'package:flutter/material.dart';

import '../../Helpers/helpers.dart';
import '../../Helpers/validation_form.dart';
import '../widgets/widgets.dart';



class RecoverPassword extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _RecoverPasswordState();
  }
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final GlobalKey<FormState> _key = GlobalKey();
  bool loading = false;
  int textLength = 0;
  TextEditingController   _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
          appBar: AppBar(
            backgroundColor:
              Theme.of(context).brightness == Brightness.light
              ?Colors.blueAccent
              : Color(0xFF121212) ,
            foregroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              color:  Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text("Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                      "Don't worry! It happens. Please enter\nthe address associated with your account.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        color: Theme.of(context).brightness == Brightness.light
                                            ? Colors.black
                                            : Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 40,
                              child: TextFormFrave(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: validatedEmail,
                                hintText: 'Enter your Email',
                                prefixIcon: Icon(Icons.alternate_email_rounded),

                              ),

                            )  ,
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient:  LinearGradient(
                                  colors: Theme.of(context).brightness == Brightness.light
                                      ?
                                  [
                                    Colors.black,
                                    Colors.blueAccent
                                  ]
                                      : [Color(0xE6600D51), Colors.blueAccent],),
                              ),
                                margin:
                                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                                child: ButtonTheme(
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        _key.currentState!.save();
                                        Navigator.of(context).push(Routing().createRoute(PinCodeVerificationScreen(
                                            _emailController.text.toString())));
                                      } else {}
                                    },
                                    child:  Center(
                                        child: Text(
                                          "Send",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,

                                          ),
                                        )
                                    ),
                                  ),
                                ),

                              width: MediaQuery.of(context).size.width - 80,
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
