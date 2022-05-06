import 'package:finalrose/Bloc/Home/home_bloc.dart';
import 'package:finalrose/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'Bloc/Auth/auth_bloc.dart';
import 'Bloc/General/general_bloc.dart';
import 'Bloc/Room/room_bloc.dart';
import 'Bloc/user/user_bloc.dart';
import 'Routes/Routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => GeneralBloc()),
          BlocProvider(create: (context) => RoomBloc()),
          BlocProvider(create: (context) => HomeBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rose',
          initialRoute: 'loadingPage',
          routes: routes,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: provider.themeMode,
        ),
      );
    });
  }
}
