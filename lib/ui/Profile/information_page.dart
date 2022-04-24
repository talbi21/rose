import 'package:finalrose/Data/static_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/user/user_bloc.dart';
import '../../Helpers/helpers.dart';
import '../widgets/widgets.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _phoneController;
  late String _gender;
  late TextEditingController _email;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _email.dispose();
    super.dispose();
  }

  void initData() {
    //final userBloc = BlocProvider.of<UserBloc>(context).state.user!;

    final userBloc = StaticUser(1, "jamelbd97@gmail.com", "123456", "Jamel",
        "Bouassida", "22/08/1997", "Male", "pictureId", true, "Admin");
    //final userBloc = StaticUser(0, "", "", "", "", "", "", "", true, "");

    _firstnameController = TextEditingController(text: userBloc.firstName);
    _lastnameController = TextEditingController(text: userBloc.lastName);
    _phoneController = TextEditingController(text: userBloc.birthdate);
    if (userBloc.gender != "Male" || userBloc.gender != "Female") {
      _gender = "Male";
    } else {
      _gender = userBloc.gender;
    }
    _email = TextEditingController(text: userBloc.email);
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context, 'Checking...');
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SetUserState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: TextFrave(
              text: 'My Profile',
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.white,
              fontWeight: FontWeight.w500),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [],
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            children: [
              const SizedBox(height: 30.0),
              SizedBox(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: const Icon(
                          Icons.person,
                          size: 120,
                        )),
                  )),
              const SizedBox(height: 30.0),
              /*TextFrave(
                  text: 'Account data',
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.white),
              const SizedBox(height: 10.0),
              BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) => state.user != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextFrave(
                                      text: 'User',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  TextFrave(
                                      text: state.user!.firstName,
                                      fontSize: 18),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextFrave(
                                      text: 'Email',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  TextFrave(
                                      text: state.user!.email, fontSize: 18),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const ShimmerFrave()),*/
              Center(
                child: TextFrave(
                    text: 'Personal Information',
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white),
              ),
              const SizedBox(height: 25.0),
              TextFormFrave(
                controller: _firstnameController,
                hintText: 'Enter your First Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _lastnameController,
                hintText: 'Enter Last Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _phoneController,
                hintText: 'Enter your Phone Number',
                prefixIcon: const Icon(Icons.phone_android_rounded),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20),
                decoration: ShapeDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black26,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Color.fromARGB(70, 0, 0, 0)),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _gender,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _gender = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            value == "Male"
                                ? const Icon(Icons.male)
                                : const Icon(Icons.female),
                            const SizedBox(width: 12.0),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _email,
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.home_outlined),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => {
                  if (_keyForm.currentState!.validate())
                    {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      )
                    }
                },
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
