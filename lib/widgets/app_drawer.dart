import 'package:flutter/material.dart';
import '../screens/fliters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(
      BuildContext context,
      IconData iconData,
      String title,
      VoidCallback onTap,
      ) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.orange[900],
            child: const Text(
              'دليلك السياحي',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            context,
            Icons.card_travel,
            'الرحلات',
                () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            context,
            Icons.filter_list,
            'الفلترة',
                () {
              Navigator.of(context).pushReplacementNamed(FlitersScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}
