import '../screens/catogry_trips_screen.dart';
import 'package:flutter/material.dart';

class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  Category_item(this.title, this.imageUrl, this.id);

  void selectPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CatogryTripsScreen.screenRoute,
      arguments: {
        'id': id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectPage(context);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
