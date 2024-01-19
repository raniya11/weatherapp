
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/homepage.dart';
import 'package:weatherapp/services/location_provider.dart';
import 'package:weatherapp/services/weather_service_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LocationProvider()),
        ChangeNotifierProvider(create: (context)=>WeatherServiceProvider()),

      ],
      child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(

            appBarTheme: AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation:0,
            ),




            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
