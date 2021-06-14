import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatapp/Model/ChatModel.dart';



class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.contact}): super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 2),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blueGrey[200],
                child: SvgPicture.asset(
                  'assets/person.svg',

                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(

                  backgroundColor: Colors.grey,
                  radius: 9,
                  child: Icon(Icons.clear,color: Colors.white,size: 18,)),
            ),

          ],
        ),
        SizedBox(
          height: 2,
        ),

        Text(contact.name,style: TextStyle(fontSize: 12),),
              ],
    );
  }
}
