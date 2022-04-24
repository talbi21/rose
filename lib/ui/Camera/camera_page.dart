import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'camerascreen.dart';

class Camera_Page extends StatefulWidget {
  @override
  State<Camera_Page> createState() => _Camera_PageState();
}

class _Camera_PageState extends State<Camera_Page> {
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
          CameraScreen(),
          Positioned(
            bottom: 0,
            child: Container(
                width: size.width,
                child: Align(
                    alignment: Alignment.center,
                    child: BottomNavigationFrave(index: 2))),
          ),
        ],
      ),
    );
  }
}
