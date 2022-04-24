import 'package:flutter/material.dart';

import 'musicscreen.dart';

class Music_Page extends StatefulWidget {
  @override
  State<Music_Page> createState() => _Music_PageState();
}

class _Music_PageState extends State<Music_Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
        Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Stack(
        children: [
          MusicScreen(),
        ],
      ),
    );
  }
}
