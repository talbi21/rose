import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Bloc/Room/room_bloc.dart';
import '../../../Data/content_model.dart';
import '../../../Helpers/helpers.dart';
import '../../Home/home_page.dart';
import '../../themes/colors_frave.dart';
import '../../widgets/widgets.dart';
import '../profile_page.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  late TextEditingController _nameProductController;
  late TextEditingController _descriptionProductController;
  late TextEditingController _stockController;
  late TextEditingController _priceController;
  final _keyForm = GlobalKey<FormState>();
  final List<String> subjects = ["Achref", "Maher", "Wajih"];

  String selectedSubject = "Owner";

  @override
  void initState() {
    _nameProductController = TextEditingController();
    _descriptionProductController = TextEditingController();
    _stockController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameProductController.clear();
    _nameProductController.dispose();
    _descriptionProductController.clear();
    _descriptionProductController.dispose();
    _stockController.clear();
    _stockController.dispose();
    _priceController.clear();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final roomBloc = BlocProvider.of<RoomBloc>(context);
   // final categoryBloc = BlocProvider.of<CategoryBloc>(context);

    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if(state is LoadingRoomState){
          modalLoading(context, 'Checking...');
        }else if(state is FailureRoomState){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessRoomState ){
          Navigator.pop(context);
          modalSuccess(context, 'Room Added!', onPressed: (){
            Navigator.pushAndRemoveUntil(context, routeSlide(page: HomePage()), (_) => false);
          });
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
            backgroundColor:  Theme.of(context).brightness == Brightness.light
                ?Colors.blueAccent
                : Color(0xFF121212) ,

            elevation: 0,
            title:  TextFrave(text: 'Add New Room', fontSize: 20, fontWeight: FontWeight.bold,color:Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white, ),
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () => Navigator.pop(context),
              icon:  Icon(Icons.arrow_back_ios_new_rounded, color:Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white),
            ),
            actions: [
              TextButton(
                /*
                  onPressed: () {
                    if(_keyForm.currentState!.validate()){

                      roomBloc.add( OnSaveNewRoomEvent(
                          _nameProductController.text.trim(),
                          _descriptionProductController.text.trim(),
                          _stockController.text.trim(),
                          _priceController.text.trim(),


                      ));

                    }
                  },

                 */


                  onPressed: () {
                  modalSuccess(context, 'Room Added!', onPressed: (){
                    Navigator.pushAndRemoveUntil(context, routeSlide(page: HomePage()), (_) => false);
                  }); },
                  child:  TextFrave(text: 'Save', color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white, fontWeight: FontWeight.w500, )
              )
            ],
          ),
          body: Form(
            key: _keyForm,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              children: [



                const SizedBox(height: 20.0),
                TextFormFrave(
                  controller: _nameProductController,
                  prefixIcon: const Icon(Icons.add),
                  hintText: 'Name',
                  validator: RequiredValidator(errorText: 'name is required'),
                ),

                const SizedBox(height: 20.0),
                TextFormFrave(
                  controller: _descriptionProductController,
                  prefixIcon: const Icon(Icons.add),
                  hintText: 'Description',
                  validator: RequiredValidator(errorText: 'Description is required'),
                ),
                const SizedBox(height: 20.0),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white70
                          : Color(0xFF2A2B2E), //background color of dropdown button
                      border: Border.all(color: Color(0xFF2A2B2E)), //border of dropdown button
                      borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                     
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: DropdownButton<String>(


                      elevation: 0,
                      focusColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.white70
                          : Color(0xFF2A2B2E),
                      dropdownColor: Theme.of(context).brightness == Brightness.light
                          ? Color.fromRGBO(210, 214, 227,1)
                          : Colors.grey,
                      hint:  TextFrave(text: selectedSubject,color:Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white ),
                      style: GoogleFonts.getFont('Roboto', fontSize: 20,color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,),





                      onChanged: (value){

                    //    hotels.add(results as QuantHotelModel);
                        setState(() {
                          selectedSubject = value.toString();
                        });
                      },
                      items: subjects.map<DropdownMenuItem<String>>((value){
                        return DropdownMenuItem(
                          child: Text(value
                          ),


                          value: value,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                MultiSelectDialogField(
                  items: items,
                  backgroundColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.white70
                      : Color(0xFF2A2B2E),


                  selectedColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.grey,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white70
                        : Color(0xFF2A2B2E),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Color(0xFF2A2B2E),

                    ),
                  ),
                  buttonIcon: Icon(
                    Icons.device_hub,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white24,
                  ),
                  buttonText: Text(
                    "Choose your devices",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white24,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {


                    
                    //_selectedAnimals = results;
                  },
                )





              /*  InkWell(
                  onTap: () => modalCategoies(context, size),
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20.0),
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfff3f3f3),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: BlocBuilder<CategoryBloc, CategoryState>(
                          builder: (_, state)
                          => state.uidCategory != null
                              ? TextFrave(text: state.nameCategory!, color: Colors.black54)
                              : TextFrave(text: 'Select Category', color: Colors.black54)
                      )
                  ),
                ),
                */


              ],
            ),

          ),
        ),
      ),
    );
  }

}















