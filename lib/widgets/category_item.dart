

import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget{
  final String id ;
  final String title ;
  final String imageUrl;

  const CategoryItem(this.id,this.title, this.imageUrl, {super.key});
  void selectCategory(BuildContext cnx){
    Navigator.of(cnx).pushNamed(
        '/category-trips',
      arguments: {
          'id':id,
        "title":title
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(15),
             child: Image.network(
                 imageUrl,
               height: MediaQuery.of(context).size.height/2,
               fit: BoxFit.cover,
             ),
           ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            
            alignment: Alignment.center,
            child: Text(title,style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }

}