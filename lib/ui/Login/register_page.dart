import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/user/user_bloc.dart';
import '../../Helpers/helpers.dart';
import '../../Helpers/validation_form.dart';
import '../themes/colors_frave.dart';
import '../widgets/widgets.dart';
import 'login_page.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passowrdController;
  late TextEditingController passController;
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextpass = true;
  bool _obscureTextconf = true;

  @override
  void initState() {
    userController = TextEditingController();
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clear();
    userController.dispose();
    emailController.dispose();
    passowrdController.dispose();
    passController.dispose();
    super.dispose();
  }

  void clear(){
    userController.clear();
    emailController.clear();
    passowrdController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if( state is LoadingUserState ){

          modalLoading(context, 'Validating...');
        }
        if( state is SuccessUserState ){
          
          Navigator.of(context).pop();
          modalSuccess(context,'USER CREATED', onPressed: (){
            clear();
            Navigator.pushReplacement(context, routeSlide(page: SignInPage()));
          });
        }
        if( state is FailureUserState ){

          Navigator.of(context).pop();
          errorMessageSnack(context, state.error);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 0.4,
              colors:Theme.of(context).brightness == Brightness.light
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
          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.blueAccent
              : Color(0xFF121212),
            elevation: 0,
            leading: IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.close_rounded, color: Colors.white,),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              TextButton(
                child: const TextFrave(text: 'Log In', fontSize: 17, color: Colors.white ),
                onPressed: () => Navigator.of(context).pushReplacementNamed('signInPage'),
              ),
              SizedBox(width: 5)
            ],
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: BouncingScrollPhysics(),
              children: [
                TextFrave(text: 'Welcome to Rose', fontSize: 24, fontWeight: FontWeight.w600,color: Colors.white),
                SizedBox(height: 5.0),
                TextFrave(text: 'Create Account', fontSize: 17, color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.grey,),
                SizedBox(height: 20.0),
                TextFormFrave(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  controller: userController,
                  validator: RequiredValidator(errorText: 'Username is required'),
                ),

                SizedBox(height: 15.0),
                TextFormFrave(
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email_outlined),
                  controller: emailController,
                  validator: validatedEmail
                ),
                SizedBox(height: 15.0),

                TextFormField(
                  controller: passowrdController,
                  style: GoogleFonts.getFont('Roboto', fontSize: 20,color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),

                  cursorColor: ColorsFrave.secundaryColorFrave,
                  obscureText: _obscureTextpass,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                      filled: true,
                      fillColor:  Theme.of(context).brightness == Brightness.light
                          ? Colors.white70
                          : Color(0xFF2A2B2E),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xffF5F5F5))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xFF2A2B2E))),
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextpass = !_obscureTextpass;
                          });
                        },
                        child: Icon(
                          _obscureTextpass
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel: _obscureTextpass
                              ? 'show password'
                              : 'hide password',
                        ),
                      ),
                      prefixIcon: Icon(Icons.vpn_key_rounded),
                      hintStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black26
                              : Colors.grey

                      )
                  ),
                  validator: passwordValidator,
                ),

                SizedBox(height: 15.0),
                TextFormField(
                  controller: passController,
                  style: GoogleFonts.getFont('Roboto', fontSize: 20),

                  cursorColor: ColorsFrave.secundaryColorFrave,
                  obscureText: _obscureTextconf,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                      filled: true,
                      fillColor:  Theme.of(context).brightness == Brightness.light
                          ? Colors.white70
                          : Color(0xFF2A2B2E),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xffF5F5F5))),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xFF2A2B2E))),
                      hintText: 'Repeat Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTextconf = !_obscureTextconf;
                          });
                        },
                        child: Icon(
                          _obscureTextconf
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel: _obscureTextconf
                              ? 'show password'
                              : 'hide password',
                        ),
                      ),
                      prefixIcon: Icon(Icons.vpn_key_rounded),
                      hintStyle: TextStyle(
                          color:Theme.of(context).brightness == Brightness.light
                              ? Colors.black26
                              : Colors.grey

                      )
                  ),
                  validator: (val) => MatchValidator(errorText: 'Password do not macth ').validateMatch(val!, passowrdController.text),
                ),

                SizedBox(height: 25.0),

                Row(
                  children:  [
                    Icon(Icons.check_circle_rounded, color: Color(0xff0C6CF2)),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By creating an account, you are agreeing\n to our",
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Color(0xFF2A2B2E)
                              : Colors.white
                        ),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions ",
                            style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xff0C6CF2)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showModal(
                                  context: context,
                                  configuration: FadeScaleTransitionConfiguration(),
                                  builder: (context) {
                                    return PolicyDialog(
                                      mdFileName: 'terms_and_conditions.md',
                                    );
                                  },
                                );
                              },
                          ),
                          TextSpan(text: "and "),
                          TextSpan(
                            text: "Privacy Policy! ",
                            style: TextStyle(fontWeight: FontWeight.bold,color:  Color(0xff0C6CF2)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return PolicyDialog(
                                      mdFileName: 'privacy_policy.md',
                                    );
                                  },
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25.0),
                Container(
                  width: size.width,
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
                  child: MaterialButton(
                    minWidth: size.width,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,

                      ),
                    ),
                    onPressed: (){
                      if( _formKey.currentState!.validate() ){
                        userBloc.add( OnAddNewUser(
                            userController.text.trim(),
                            emailController.text.trim(),
                            passowrdController.text.trim()
                        ));
                      }
                    },
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


