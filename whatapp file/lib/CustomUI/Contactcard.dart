import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatapp/Model/ChatModel.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({Key  key, this.contact}) : super(key:key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Container(
        height: 65,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                'assets/person.svg',
                color: Colors.white,
              ),
            ),
            contact.Select
                ? Positioned(
                    bottom: 10,
                    right: 5,
                    child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 9,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )),
                  )
                : Container(),
          ],
        ),
      ),
      title:Text( contact.name,style: TextStyle(
          fontWeight: FontWeight.bold
      ),),
      subtitle: Text(contact.status),
    );
  }
}

