import './screens/filter_screen.dart';

import './screens/tabs_screen.dart';
import './screens/catogry_trips_screen.dart';
import './screens/trip_details_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.amber,
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline5: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  headline6: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                )),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TapsScreen(),
          CatogryTripsScreen.screenRoute:(ctx)=> CatogryTripsScreen(),
         TripDetailScreen.screenRoute:(ctx)=> TripDetailScreen(),
         FilterScreen.filterRoute: (cxt)=> FilterScreen(),
        });
  }
}
