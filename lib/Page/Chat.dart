import 'package:flutter/material.dart';
import 'package:whatapp/CustomUI/CustomCard.dart';
import 'package:whatapp/Model/ChatModel.dart';
import 'package:get/get.dart';
import 'package:whatapp/screens/Selectcontact.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatModel> chat = [
    ChatModel(
      name: 'Atiq Ur Rehman',
      time: '12:32',
      currentMessage: 'hi where are you ',
      icon: 'assets/person.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'Adil khan',
      time: '2:32',
      currentMessage: 'i will to your place today at 4 ',
      icon: 'assets/person.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'friends group',
      time: '1:12',
      currentMessage: 'please come to my office',
      icon: 'assets/group.svg',
      isGroup: true,
    ),
    ChatModel(
      name: 'Atta Rehman ',
      time: '6:06',
      currentMessage: 'kala ba razee',
      icon: 'assets/group.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'Muhammad Adil ',
      time: '4:12',
      currentMessage: 'how are you bro',
      icon: 'assets/group.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'Muhammad Adil ',
      time: '4:12',
      currentMessage: 'how are you bro',
      icon: 'assets/group.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'Muhammad Adil ',
      time: '4:12',
      currentMessage: 'how are you bro',
      icon: 'assets/group.svg',
      isGroup: false,
    ),
    ChatModel(
      name: 'Muhammad Adil ',
      time: '4:12',
      currentMessage: 'how are you bro',
      icon: 'assets/group.svg',
      isGroup: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Get.to(SelectContact());

        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context, index) => Custom(
          chatModel: chat[index],
        ),
      ),
    );
  }
}
