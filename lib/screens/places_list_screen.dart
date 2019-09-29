import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('No places yet!'),
        ),
        builder: (context, greatPlaces, ch) => Center(
          child: greatPlaces.items.length <= 0
              ? ch
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.items[index].image,
                      ),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    onTap: () {},
                  ),
                ),
        ),
      ),
    );
  }
}
