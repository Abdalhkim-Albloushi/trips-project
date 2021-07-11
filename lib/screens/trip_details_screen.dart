import 'package:flutter/material.dart';
import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  Widget buildListViewContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: child);
  }

  Widget buildSectionTrip(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTrip(context, 'الانشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (cxt, index) => Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTrip(context, 'البنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("يوم${index + 1}"),
                      ),
                      title: Text(selectTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(tripId);
        },
      ),
    );
  }
}
