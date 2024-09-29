import 'package:flutter/material.dart';
import 'package:trveling_app/screens/trip_detail_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
 //final Function removeItem;
  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
   // required this.removeItem,
  });

  void selectTrip(BuildContext context) {
     Navigator.of(context).pushNamed(TripDetailScreen.screenRoute,
     arguments:id ).then((result){
      if(result != null){
      //  removeItem(result);
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.today, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text("$duration أيام"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.wb_sunny, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text(seasonText(season)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.family_restroom, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text(tripTypeText(tripType)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}