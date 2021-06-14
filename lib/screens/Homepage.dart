import 'package:flutter/material.dart';
import 'package:whatapp/Page/CameraPage.dart';
import 'package:whatapp/Page/Chat.dart';



class Homepage extends StatefulWidget {
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (BuildContext )

          {
            return [
              PopupMenuItem(child: Text('New Group'), value: 'New Group',),
              PopupMenuItem(child: Text('New Boardcast'), value: 'New Boardcast',),
              PopupMenuItem(child: Text('Whatsapp Web'), value: 'Whatsapp Web',),
              PopupMenuItem(child: Text('Starred Messages'), value: 'Starred Messages',),
              PopupMenuItem(child: Text('Settings'), value: 'Settings',),
            ];
          }
         
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: IconButton(
                icon: Icon(Icons.camera_alt),
              ),
            ),

            Tab(
              text: 'CHAT',
            ),

            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
controller: _controller,
        children: [
         CameraPage(),
          Chat(),
          Text('status'),
          Text('calls'),
        ],
      ),
    ));
  }
}
