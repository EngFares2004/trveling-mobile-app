import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../app_data.dart';
import '../models/trip.dart';
import '../screens/category_trips_screen.dart';
import '../screens/fliters_screen.dart';
import '../screens/trip_detail_screen.dart';
import '../widgets/tabs_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {

const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map <String , bool> _filters ={
  'summer':false,
  'winter':false,
  'family':false,
};
  List<Trip> _availableTrips =tripsData;
  final List<Trip> _favoriteTrips =[];
  void _changeFilters(Map<String , bool>filterData) {
    setState(() {
      _filters =filterData;
    _availableTrips =tripsData.where((trip){
     if(_filters['summer']== true && trip.isInSummer != true){
       return false;
     }
     if(_filters['winter']== true && trip.isInWinter != true){
       return false;
     }
     if(_filters['family']== true && trip.isForFamilies != true){
       return false;
     }
     return true;
    }).toList();
    });
  }
 void _manageFavorite(String tripId){
 final existingIndex =_favoriteTrips.indexWhere((trip) => tripId ==trip.id);
 if(existingIndex >=0){
   setState(() {
     _favoriteTrips.removeAt(existingIndex);
   });
 }else{
   setState(() {
     _favoriteTrips.add(tripsData.firstWhere((trip) => tripId== trip.id));
   });
 }

 }
bool _isFavorite(String id){
    return _favoriteTrips.any((trip) => trip.id == id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar','AE'),
        Locale('es',''),
      ],
      title: 'Travel App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AutofillHints.language,
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineSmall: const TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
          initialRoute: '/',
      routes:  {
        '/':(cnx)=> TabsScreen(_favoriteTrips),
        '/category-trips':(cnx)=>  CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute:(cnx)=> TripDetailScreen(_manageFavorite,_isFavorite),
        FlitersScreen.screenRoute :(cnx )=> FlitersScreen(_filters,_changeFilters),
      },
    );
  }

}


