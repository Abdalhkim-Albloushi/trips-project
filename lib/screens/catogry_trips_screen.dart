import 'package:forthapp/models/trips.dart';

import '../app_data.dart';
import '../widget/trips_item.dart';
import 'package:flutter/material.dart';

class CatogryTripsScreen extends StatefulWidget {
  static const screenRoute = '/catogry-trips';

  @override
  _CatogryTripsScreenState createState() => _CatogryTripsScreenState();
}

class _CatogryTripsScreenState extends State<CatogryTripsScreen> {
  String? newTitle;
  List<Trip>? displayTrips;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
final routArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final newId = routArgument['id'];
    newTitle = routArgument['title'];
    displayTrips = Trips_data.where(
      (trips) {
        return trips.categories.contains(newId);
      },
    ).toList();

    super.didChangeDependencies();
  }

  void _removeTrip(String tripid) {
    setState(() {
      displayTrips!.removeWhere((trip) => trip.id == tripid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return TripsItem(
            
            title: displayTrips![i].title,
            imageUrl: displayTrips![i].imageUrl,
            tripType: displayTrips![i].tripType,
            season: displayTrips![i].season,
            duration: displayTrips![i].duration,
            id: displayTrips![i].id,
            removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips!.length,
      ),
    );
  }
}
