import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Profil Saya",
        style:
         TextStyle(fontFamily:"PlaywritePL" ), ) , 
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body:Column(
          
           children: [
          Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [Text("Nama : ", style:
         TextStyle(fontFamily:"PlaywritePL" ),), Text("Mutiara Sa'diyah", style:
         TextStyle(fontFamily:"PlaywritePL" ),)],
        ),
        Icon(Icons.location_on),
        Text(
          "Jakarta",style:
         TextStyle(fontFamily:"PlaywritePL" ),
         
        ),Text(
          "Lulusan baru penasaran sama coding tapi jadi stress gara gara coding",style:
         TextStyle(fontFamily:"PlaywritePL" ),
        )

        ]
        ) ,
      
      
      
    );
  }
}