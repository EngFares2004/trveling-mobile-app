import 'package:flutter/material.dart';
import 'package:trveling_app/app_data.dart';
import 'package:trveling_app/main.dart';
// ,
class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  final Function manageFavorite;
  final Function isFavorite;

  Widget buildSectionTitle(BuildContext context,String titleText) {
    return  Container(

      margin: const EdgeInsets.all(10),
      alignment: Alignment.topRight,
      child:  Text(
       titleText,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        overflow: TextOverflow.fade,
      ),
    );
  }
  const TripDetailScreen(this.manageFavorite,this.isFavorite,{super.key});

  @override
  Widget build(BuildContext context) {
    final String? tripId = ModalRoute.of(context)?.settings.arguments as String?;

    if (tripId == null) {
      return  const MyApp();
    }

    final selectedTrip = tripsData.firstWhere(
          (trip) => trip.id == tripId,

    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'تفاصيل الرحلة',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    selectedTrip.imageUrl,
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
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
                    selectedTrip.title,
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
            buildSectionTitle(context,'الأنشطة'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: selectedTrip.activities.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context,'البرنامج اليومي '),
            Container(

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: selectedTrip.program.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                      child: Card(
                        elevation: 0.3 ,
                        child: Container(
                          height:90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text('يوم ${index+1}')),
                      ),
                      ),
                      title:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedTrip.program[index]),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100,),

          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: ()=>
         manageFavorite(tripId),
        backgroundColor: Colors.orange,
        child: Icon(
            isFavorite(tripId)? Icons.star: Icons.star_border
        ),
      ),

    );
  }
}
