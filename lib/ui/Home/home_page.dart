import 'package:flutter/material.dart';

import '../../Helpers/helpers.dart';
import 'homescreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _allow = true;

    return

        /*
      BlocListener<ProductBloc, ProductState>(
      listener: (context, state){
        if( state is LoadingProductState ){
          modalLoadingShort(context);
        }else if( state is FailureProductState ){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessProductState ){
          Navigator.pop(context);
          setState(() {});
        }
      },
      child: */
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
    );
  }
}
