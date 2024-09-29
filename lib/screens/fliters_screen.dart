import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FlitersScreen extends StatefulWidget {


  static const screenRoute = '/filters';
  final Function saveFilter ;
  final   Map <String , bool> currentFilters;
  const FlitersScreen(this.currentFilters,this.saveFilter, {super.key});

  @override
  State<FlitersScreen> createState() => _FlitersScreenState();
}

class _FlitersScreenState extends State<FlitersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  initState(){
    _summer =widget.currentFilters['summer']!;
    _winter =widget.currentFilters['winter']!;
    _family =widget.currentFilters['family']!;
    super.initState();

  }

  Widget buildSwitchListTile(
      BuildContext context,
      String title,
      String subtitle,
      bool currentValue,
      ValueChanged<bool> updateValue,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.greenAccent[200],
         borderRadius: BorderRadius.circular(15)
      ),
      child: SwitchListTile(
        value: currentValue,
        onChanged: updateValue,
        activeColor: Colors.black,
        inactiveThumbColor: Colors.black,
        activeTrackColor: Colors.orangeAccent,
        inactiveTrackColor: Colors.red,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(subtitle,style:const TextStyle(
          color: Colors.grey
        ),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'الفلترة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(onPressed:(){
            final selectedFilters ={
              'summer':_summer,
              'winter':_winter,
              'family':_family,
            };
            widget.saveFilter(selectedFilters);},
              icon:const Icon(Icons.save,color: Colors.orange,)
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    context,
                    'الرحلات الصيفية',
                    'اظهار الرحلات الصيفية فقط',
                    _summer,
                        (newValue) {
                      setState(() {
                        _summer = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    context,
                    'الرحلات الشتوية',
                    'اظهار الرحلات الشتوية فقط',
                    _winter,
                        (newValue) {
                      setState(() {
                        _winter = newValue;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    context,
                    'الرحلات مع العائلات',
                    'اظهار الرحلات التي للعائلات فقط',
                    _family,
                        (newValue) {
                      setState(() {
                        _family = newValue;
                      });
                    },
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
