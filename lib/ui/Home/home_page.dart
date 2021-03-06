import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Home/home_bloc.dart';
import '../../Helpers/helpers.dart';
import 'homescreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _allow = true;

    return


      BlocProvider(
        create: (context) => HomeBloc()..add(OnGetHomeEvent()),
        child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LoadingHomeState) {
                print("oui11");
                modalLoadingShort(context);
              } else if (state is FailureHomeState) {
                Navigator.pop(context);
                print("no1");
                errorMessageSnack(context, state.error);
              } else if (state is SuccessHomeState) {
                print("no2");
                Navigator.pop(context);
                setState(() {
                  state.home;
                });
              }
            },
            child:
            WillPopScope(
              onWillPop: () {
                print(
                    'Backbutton pressed (device or appbar button), do whatever you want.');
                //trigger leaving and use own data
                modalExit(context);

                //we need to return a future
                return Future.value(false);
              },
              child: Scaffold(
                backgroundColor: Color(0xfff5f5f5),
                body: Stack(
                  children: [
                    HomeScreen(),
                  ],
                ),
              ),
            )),
      );
  }
}
