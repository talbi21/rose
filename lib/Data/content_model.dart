import 'package:finalrose/ui/Qr%20code/generateQr.dart';
import 'package:finalrose/ui/Qr%20code/scanQr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../ui/Camera/camerascreen.dart';
import '../ui/Music/musicscreen.dart';
import '../ui/Profile/add_product/add_product_page.dart';
import '../ui/Profile/profile_page.dart';
import '../ui/Room/roomscreen.dart';
import '../ui/Tv/tvscreen.dart';

class Cameras {
  final String image;

  const Cameras({required this.image});
}

class Music {
  final String label;
  final String name;
  final String author;

  const Music({required this.label, required this.name, required this.author});
}

class Film {
  final String label;
  final String name;
  final String Season;

  const Film({required this.label, required this.name, required this.Season});
}

List<Cameras> videos = [
  const Cameras(image: 'Assets/img/cam1.jpg'),
  const Cameras(image: 'Assets/img/cam1.jpg'),
  const Cameras(image: 'Assets/img/cam3.jpg'),
];
List<Music> songs = [
  const Music(
      label: 'Assets/img/ex2.jpg', author: '2Pac', name: 'All Ayes On Me'),
];

List<Film> films = [
  const Film(label: 'Assets/img/foundou.jpg', name: 'El foundou', Season: '2'),
];

class InfraredCode {
  final String id;
  final String function;
  final String value;

  InfraredCode(this.id, this.function, this.value);
}

class Device {
  final String id;
  final String name;
  final String type;
  final List<InfraredCode> infraredCodes;

  Device(this.id, this.name, this.type, this.infraredCodes);
}

List<Device> _devices = [
  Device("1", "Lampe", "", []),
  Device("1", "Fan", "", []),
  Device("1", "Speaker", "", []),
  Device("1", "TV", "", []),
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
  final Route;

  final Icon;

  QuantHotelModel(
      {required this.name, required this.color, this.Route, this.Icon});
}

final List<QuantHotelModel> hotels = [
  QuantHotelModel(
      name: "Living room",
      color: "purple",
      Route: RoomScreen(),
      Icon: Icons.airplay),
  QuantHotelModel(
      name: "bathroom",
      color: "black",
      Route: RoomScreen(),
      Icon: Icons.auto_delete),
  QuantHotelModel(
      name: "bedroom",
      color: "black22",
      Route: RoomScreen(),
      Icon: Icons.airline_seat_individual_suite),
  QuantHotelModel(
      name: "Kitchen",
      color: "black22",
      Route: RoomScreen(),
      Icon: Icons.bathtub_outlined),
  QuantHotelModel(
      name: "suite", color: "black22", Route: RoomScreen(), Icon: Icons.bed),
  QuantHotelModel(
      Route: RoomScreen(), name: "office", color: "black22", Icon: Icons.block),
  QuantHotelModel(
      name: "bathroom2",
      color: "black22",
      Route: RoomScreen(),
      Icon: Icons.airplay)
];

class mainDevicesModel {
  final String name;
  final String color;
  final String label;

  mainDevicesModel({
    required this.name,
    required this.color,
    required this.label,
  });
}

final List<mainDevicesModel> devicesA = [
  mainDevicesModel(
    name: "Lampe",
    color: "black",
    label: "Assets/img/smart-tv.png",
  ),
  mainDevicesModel(
    name: "Camera",
    color: "black",
    label: "Assets/img/camera-de-surveillance.png",
  ),
  mainDevicesModel(
    name: "Music",
    color: "black",
    label: "Assets/img/speaker.png",
  ),
  mainDevicesModel(
    name: "Screen mirror",
    color: "black",
    label: "Assets/img/smart-tv.png",
  ),
  mainDevicesModel(
    name: "Screen mirror",
    color: "black",
    label: "Assets/img/smart-tv.png",
  ),
  mainDevicesModel(
    name: "Screen mirror",
    color: "black",
    label: "Assets/img/smart-tv.png",
  )
];

class AuthProvider {
  static final AuthProvider _shared = AuthProvider._sharedInstance();

  AuthProvider._sharedInstance();

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 5));
  }
}

List<Map> drawerItems = [
  {
    'icon': FontAwesomeIcons.plus,
    'title': 'Add room',
    'screen': AddProductPage()
  },
  {'icon': Icons.connected_tv, 'title': 'TV', 'screen': TvScreen()},
  {'icon': Icons.music_note_rounded, 'title': 'Music', 'screen': MusicScreen()},
  {
    'icon': Icons.video_camera_back_outlined,
    'title': 'Cameras',
    'screen': CameraScreen()
  },
  {'icon': Icons.settings, 'title': 'Settings', 'screen': ProfilePage()},
  {'icon': Icons.person, 'title': 'Add Guest', 'screen': QRViewExample()},
  {'icon': Icons.home, 'title': 'Add Home', 'screen': GenerateQR()},
];
