import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteTrips,{super.key});
  final List<Trip> favoriteTrips;
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;


 late List<Map<String ,dynamic>> _screens;

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  initState(){
    _screens =[
      {
        "Screen": const CategoriesScreen(),
        "title": "تصنيفات الرحلات",
      },
      {
        "Screen": FavoritesScreen(widget.favoriteTrips),
        "title": "الرحلات مفضلة",
      },
    ];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title:  Text(
          _screens[_selectedIndex]["title"],
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

        backgroundColor: Colors.purple,
      ),
      drawer: const AppDrawer(),

      body: _screens[_selectedIndex]["Screen"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التطبيقات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}



