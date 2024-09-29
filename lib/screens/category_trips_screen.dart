import 'package:flutter/material.dart';
import 'package:trveling_app/screens/categories_screen.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  final List<Trip> availableTrips;
  const CategoryTripsScreen(this.availableTrips, {super.key});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
late String  categoryId;
late String categoryTitle;
late List <Trip> displayTrips;

  @override
  initState(){
    super.initState();

  }

  @override
  void didChangeDependencies() {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    categoryTitle =routeArgument!['title']!;
   categoryId =routeArgument['id']!;

    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(routeArgument['id']);
    }).toList();

    super.didChangeDependencies();
  }
  void _removeTrip(String tripId){
    setState(() {
      displayTrips.removeWhere((trip) =>tripId ==trip.id);
    });
  }
  @override
  Widget build(BuildContext context) {
   if (categoryId  == null) {
    return const CategoriesScreen();
      }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            categoryTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            season: displayTrips[index].season,
            tripType: displayTrips[index].tripType,
           //removeItem:_removeTrip,
          );
        },
      ),
    );
  }
}