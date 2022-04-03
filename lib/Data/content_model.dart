import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../ui/Camera/camerascreen.dart';
import '../ui/Music/musicscreen.dart';
import '../ui/Profile/add_product/add_product_page.dart';
import '../ui/Profile/profile_page.dart';
import '../ui/Room/roomscreen.dart';



class UnbordingContent {
  final String image;
  final String title;
  final String discription;

  const UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  const UnbordingContent(
      title: 'Rose is the future',
      image: 'assets/images/smart.jpg',
      discription: "ROSE can help you to access multiple devices faster than ever. "
          "With this, you can control home IoT devices like a refrigerator, washer, and dryer, dishwasher air conditioner, etc."),
  const UnbordingContent(
      title: 'A click is enough',
      image: 'assets/images/smart_garage.jpg',
      discription: "Not only can you open close and check the status of the garage door,"
          " but it will also help you to do the same with other doors in the house as well. "),
  const UnbordingContent(
      title: 'Your technological helping hand',
      image: 'assets/images/light.jpg',
      discription: "With ROSE, you can check the temperature of the house, also control  the light settings anytime anywhere"),
];

List<BoxShadow> shadowList = [
  BoxShadow(color: Color(0xE60C0A0B), blurRadius: 30, offset: Offset(0, 10))
];

class Cameras {
  final String image;


  const Cameras(
      {required this.image});
}
class Music {
  final String label;
  final String name;
  final String author;


  const Music(
      {required this.label,required this.name,required this.author});
}

List<Cameras> videos = [
  const Cameras(
      image: 'assets/cam1.jpg'),
  const Cameras(
      image: 'assets/cam1.jpg'),

      const Cameras(

      image: 'assets/cam3.jpg'),

          ];
List<Music> songs = [
  const Music(
      label: 'assets/ex2.jpg',
      author: 'Bob Marley',
      name: 'All Ayes On Me'),


];

class Device {
  final int id;
  final String name;

  Device({
    required this.id,
    required this.name,
  });
}

 List<Device> _devices = [
   Device(id: 1, name: "Lampe"),
   Device(id: 2, name: "Fan"),
   Device(id: 3, name: "Speaker"),
   Device(id: 4, name: "Smart TV"),
   Device(id: 5, name: "ex1"),
   Device(id: 6, name: "ex2"),
   Device(id: 7, name: "ex3"),
   Device(id: 8, name: "ex3"),

];
List<MultiSelectItem<Device>> items = _devices
    .map((animal) => MultiSelectItem<Device>(animal, animal.name))
    .toList();
//List<Animal> _selectedAnimals = [];
List<Device> _selectedAnimals2 = [];
List<Device> _selectedAnimals3 = [];
//List<Animal> _selectedAnimals4 = [];
List<Device> _selectedAnimals5 = [];
final _multiSelectKey = GlobalKey<FormFieldState>();





class QuantHotelModel {
  final String name;
  final String color;
  final Route ;
  final  Icon;



  QuantHotelModel({
    required this.name,
    required this.color,
    this.Route,
    this.Icon



  });
}

final List<QuantHotelModel> hotels = [
  QuantHotelModel(

    name: "Living room",
    color:"purple",
      Route: RoomScreen(),
    Icon: Icons.airplay


  ),QuantHotelModel(

    name: "bathroom",
      color:"black",
      Route: RoomScreen(),
      Icon: Icons.auto_delete


  ),QuantHotelModel(

      name: "bedroom",
      color:"black22",
      Route: RoomScreen(),
    Icon: Icons.airline_seat_individual_suite


  ),QuantHotelModel(

      name: "Kitchen",
      color:"black22",
      Route: RoomScreen(),
      Icon: Icons.bathtub_outlined


  ),QuantHotelModel(

      name: "suite",
      color:"black22",
      Route: RoomScreen(),
      Icon: Icons.bed


  ),QuantHotelModel(
      Route: RoomScreen(),
      name: "office",
      color:"black22",

      Icon: Icons.block


  ),QuantHotelModel(

      name: "bathroom2",
      color:"black22",
      Route: RoomScreen(),
      Icon: Icons.airplay



  )

];
class mainDevicesModel {
  final String name;
  final String color;



  mainDevicesModel({
    required this.name,
    required this.color,
  });
}
final List<mainDevicesModel> devicesA = [
  mainDevicesModel(

    name: "Lampe",
    color:"purple",


  ),mainDevicesModel(

      name: "Camera",
      color:"black"


  ),mainDevicesModel(

      name: "Music",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  ),mainDevicesModel(

      name: "Screen mirroring",
      color:"black22"


  )


];
class AuthProvider{
  static final AuthProvider _shared = AuthProvider._sharedInstance();
  AuthProvider._sharedInstance();

  Future<void> login() async{
    await Future.delayed(const Duration(seconds: 5));
  }
  Future<void> logout() async{
    await Future.delayed(const Duration(seconds: 5));
  }

}
List<Map> drawerItems = [

  {'icon': FontAwesomeIcons.plus, 'title': 'Add room', 'screen':AddProductPage()
  },
  {'icon': Icons.music_note_rounded, 'title': 'Music', 'screen': MusicScreen()},
  {'icon': Icons.video_camera_back_outlined, 'title': 'Cameras', 'screen': CameraScreen()},
  {'icon': Icons.settings, 'title': 'Settings', 'screen': ProfilePage()},
];



