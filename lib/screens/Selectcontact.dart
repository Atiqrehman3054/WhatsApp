import 'package:flutter/material.dart';
import 'package:whatapp/CustomUI/Buttoncard.dart';
import 'package:whatapp/CustomUI/Contactcard.dart';
import 'package:whatapp/Model/ChatModel.dart';
import 'package:whatapp/Page/Chat.dart';
import 'package:get/get.dart';
import 'package:whatapp/screens/Creatgroup.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> Contact = [
      ChatModel(name: 'Atiq Ur Rehman', status: 'i am at home'),
      ChatModel(name: 'Adil', status: 'i am out side home'),
      ChatModel(name: 'Waseem', status: 'where are you'),
      ChatModel(name: 'Anjum', status: 'come to home'),
      ChatModel(name: 'Jone', status: 'i am still waiting here'),
      ChatModel(name: 'Unknown', status: 'who are you'),
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '267 Contact',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              InkWell(
                onTap: () {},
                child: PopupMenuButton<String>(onSelected: (value) {
                  print(value);
                }, itemBuilder: (buildContext) {
                  return [
                    PopupMenuItem(
                      child: Text('Invite a friend'),
                      value: 'Invite a friend',
                    ),
                    PopupMenuItem(
                      child: Text('Contacts'),
                      value: 'Contacts',
                    ),
                    PopupMenuItem(
                      child: Text('Refresh'),
                      value: 'Refresh',
                    ),
                    PopupMenuItem(
                      child: Text('Help'),
                      value: 'Help',
                    ),
                  ];
                }),
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: Contact.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: (){
                      Get.to(Creategroup());
                    },
                    child: ButtonCard(
                      icon: Icons.group,
                      name: 'New group' ,
                    ),
                  );
                } else if (index == 1) {
                  return InkWell(

                  onTap: (){

                  },
                  child: ButtonCard(
                      icon: Icons.person_add,
                      name: 'New Contact',
                    ),
                  );
                }
                return Contactcard(
                  contact: Contact[index]
                );
              })
          // ListView(
          //   children: [
          //     Contactcard(),],
          // ),
          ),
    );
  }
}
