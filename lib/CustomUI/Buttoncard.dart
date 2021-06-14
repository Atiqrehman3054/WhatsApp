import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatapp/Model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key  key, this.name, this.icon}) : super(key:key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(

        radius: 23,
        backgroundColor: Colors.green,
        child: Icon(icon,color: Colors.white,),
      ),
      title:Text(name,style: TextStyle(
        fontWeight: FontWeight.bold
      ),),

    );
  }
}

