import 'package:flutter/material.dart';
import 'package:whatapp/CustomUI/AvatarCard.dart';
import 'package:whatapp/CustomUI/Buttoncard.dart';
import 'package:whatapp/CustomUI/Contactcard.dart';
import 'package:whatapp/Model/ChatModel.dart';
import 'package:whatapp/Page/Chat.dart';

class Creategroup extends StatefulWidget {
  @override
  _CreategroupState createState() => _CreategroupState();
}

class _CreategroupState extends State<Creategroup> {
  List<ChatModel> Contact = [
    ChatModel(name: 'Asim Khan', status: 'i am at home'),
    ChatModel(name: 'Adil', status: 'i am out side home'),
    ChatModel(name: 'name', status: 'where are you'),
    ChatModel(name: 'Anjum', status: 'come to home'),
    ChatModel(name: 'Jone', status: 'i am still waiting here'),
    ChatModel(name: 'Unknown', status: 'who are you'),
    ChatModel(name: 'Asim Khan', status: 'i am at home'),
    ChatModel(name: 'Adil', status: 'i am out side home'),
    ChatModel(name: 'name', status: 'where are you'),
    ChatModel(name: 'Anjum', status: 'come to home'),
    ChatModel(name: 'Jone', status: 'i am still waiting here'),
    ChatModel(name: 'Unknown', status: 'who are you'),
  ];
  List<ChatModel> group = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New group',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Add participants',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
          body: Stack(
            children: [
              ListView.builder(
                  itemCount: Contact.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (Contact[index].Select == false) {
                          setState(() {
                            Contact[index].Select = true;
                            group.add(Contact[index]);
                          });
                        } else {
                          setState(() {
                            Contact[index].Select = false;
                            group.remove(Contact[index]);
                          });
                        }
                      },
                      child: Contactcard(contact: Contact[index]),
                    );
                  }),

              group.length>0 ? Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Contact.length,
                        itemBuilder: (context, index)
                        {
                          if(Contact[index].Select==true)
                            {
                              return InkWell(

                                onTap:(){
                                  setState(() {
                                    Contact[index].Select = false;
                                    group.remove(Contact[index]);
                                  });
                                },
                                child: AvatarCard(
                                  contact: Contact[index],
                                ),
                              );

                            }
                          else
                            return Container();
                        }
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ):Container(),
            ],
          )
          // ListView(
          //   children: [
          //     Contactcard(),],
          // ),
          ),
    );
  }
}
