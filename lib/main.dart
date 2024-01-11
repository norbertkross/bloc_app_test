import 'package:bloc_app_test/src/features/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/bloc/dashboard_bloc.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  static Map<int, Color> color = const {
    50: Color.fromRGBO(124, 58, 237, .1),
    100: Color.fromRGBO(124, 58, 237, .2),
    200: Color.fromRGBO(124, 58, 237, .3),
    300: Color.fromRGBO(124, 58, 237, .4),
    400: Color.fromRGBO(124, 58, 237, .5),
    500: Color.fromRGBO(124, 58, 237, .6),
    600: Color.fromRGBO(124, 58, 237, .7),
    700: Color.fromRGBO(124, 58, 237, .8),
    800: Color.fromRGBO(124, 58, 237, .9),
    900: Color.fromRGBO(124, 58, 237, 1),
  };

  final MaterialColor colorCustom =  MaterialColor(0xFF7C3AED, color);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
            providers: [
        BlocProvider(create: (_) => DashboardBloc()), // Add other blocs as needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        
        theme: ThemeData(
          primarySwatch: colorCustom,
          fontFamily: 'Inter',
          primaryColorDark: const Color(0xFF7C3AED),
       
        ),
        home: const AppHome(),
      ),
    );
  }
}
