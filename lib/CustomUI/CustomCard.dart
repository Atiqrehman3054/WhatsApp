import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatapp/Model/ChatModel.dart';
import 'package:get/get.dart';
import 'package:whatapp/Page/individualPage.dart';


class Custom extends StatelessWidget {
  const Custom({Key key,this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>  IndividualPage(
          chatModel: chatModel,
        )));

        // Get.to('whatapp/lib/Page/individualPage.dart');
      },
      child: Column(
        children: [

          ListTile(
            leading: CircleAvatar(

              radius: 30,
              backgroundColor: Colors.grey[600],
              child: SvgPicture.asset(
                chatModel.isGroup?
                'assets/groups.svg':'assets/person.svg',
                color: Colors.white,
                height: 37,
                width: 0,
              ),
            ),
            title: Text(
             chatModel.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                Text(chatModel.currentMessage),
              ],
            ),
            trailing: Text(chatModel.time,style: TextStyle(
              fontWeight: FontWeight.bold
            ),),

          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness:  1,
            ),
          )
        ],

      ),
    );
  }
}



