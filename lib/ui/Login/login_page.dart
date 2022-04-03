import 'package:finalrose/ui/Login/recover_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/Auth/auth_bloc.dart';
import '../../Bloc/user/user_bloc.dart';
import '../../Helpers/helpers.dart';
import '../../Helpers/validation_form.dart';
import '../Home/home_page.dart';
import '../themes/colors_frave.dart';
import '../widgets/widgets.dart';
import 'loading_page.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late TextEditingController _emailController;
  late TextEditingController _passowrdController;
  final _keyForm = GlobalKey<FormState>();

  bool _obscureTextpass = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passowrdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    _passowrdController.clear();
    _passowrdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;
    final userBloc = BlocProvider.of<UserBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if( state is LoadingAuthState ){
          modalLoading(context, 'Checking...');
        }else if( state is FailureAuthState ){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessAuthState ){
          Navigator.pop(context);
         // userBloc.add(OnGetUserEvent());
          Navigator.pushAndRemoveUntil(context, routeSlide(page: HomePage()), (_) => false);
        }
      },
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(

            leading: IconButton(
              splashRadius: 20,
              icon: Icon(Icons.close_rounded, size: 25, color: Colors.white),
              onPressed: ()=> Navigator.pop(context),
            ),
            actions: [
              TextButton(
                child: TextFrave(text: 'Register', fontSize: 18, color: Colors.white,),
                onPressed: () => Navigator.of(context).pushReplacementNamed('signUpPage'),
              )
            ],
            elevation: 0,
            backgroundColor:
            Theme.of(context).brightness == Brightness.light
                ?Colors.blueAccent
                : Color(0xFF121212) ,
          ),
          body: SafeArea(
            child: Form(
              key: _keyForm,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                physics: BouncingScrollPhysics(),
                children: [

                  const SizedBox(height: 20),
                  const TextFrave(text: 'Welcome Back!', fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
                  const SizedBox(height: 5),
                  TextFrave(text: 'Sign In to your account', fontSize: 18,color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.grey
                  ),
                  const SizedBox(height: 35),

                  TextFormFrave(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validatedEmail,
                    hintText: 'Enter your Email',
                    prefixIcon: Icon(Icons.alternate_email_rounded),

                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passowrdController,
                    style: GoogleFonts.getFont('Roboto', fontSize: 20,color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white),

                    cursorColor: ColorsFrave.secundaryColorFrave,
                    obscureText: _obscureTextpass,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                        filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Color(0xFF2A2B2E),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xffF5F5F5))),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100), borderSide: BorderSide(color: Color(0xFF2A2B2E))),
                        hintText: 'Enter your password',
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
                        prefixIcon: Icon(Icons.password_rounded),
                        hintStyle: TextStyle(
                            color: Colors.white24

                        )
                    ),
                    validator: passwordValidator,
                  ),
                  const SizedBox(height:  40),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient:  LinearGradient(

                          colors:
                          Theme.of(context).brightness == Brightness.light
                              ?
                          [
                            Colors.black,
                            Colors.blueAccent
                          ]
                              : [Color(0xE6600D51), Colors.blueAccent],
                          ),
                    ),
                    child: MaterialButton(
                      minWidth: size.width,
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,

                        ),
                      ),
                      onPressed: (){
                        if( _keyForm.currentState!.validate() ){
                       //   authBloc.add(LoginEvent(_emailController.text.trim(), _passowrdController.text.trim()));
                         authBloc.emit(SuccessAuthState());
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: TextButton(

                        child: TextFrave(text: 'Forgot password?', color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.grey, fontSize: 17),
                        onPressed: () =>  Navigator.of(context).push(Routing().createRoute(RecoverPassword()))
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
         ),
      ),
    );
  }
}