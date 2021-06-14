
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';

import 'package:whatapp/Model/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? 'assets/groups.svg'
                        : 'assets/person.svg',
                    color: Colors.white,
                    height: 37,
                    width: 0,
                  ),
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.5),
                  ),
                  Text(
                    'last seen today at 12',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (buildContext) {
              return [
                PopupMenuItem(
                  child: Text('View Contact'),
                  value: 'New Group',
                ),
                PopupMenuItem(
                  child: Text('Media, Links, and docs'),
                  value: 'New Boardcast',
                ),
                PopupMenuItem(
                  child: Text('Whatsapp Web'),
                  value: 'Whatsapp Web',
                ),
                PopupMenuItem(
                  child: Text('Search'),
                  value: 'Starred Messages',
                ),
                PopupMenuItem(
                  child: Text('Mute Notification'),
                  value: 'Settings',
                ),
                PopupMenuItem(
                  child: Text('Wallpaper '),
                  value: 'Settings',
                ),
              ];
            }),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 55,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    margin: EdgeInsets.only(
                                        left: 3, right: 3, bottom: 8),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 2,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type a message',
                                        prefixIcon: IconButton(
                                          icon:
                                              Icon(Icons.emoji_emotions_outlined),
                                          onPressed: () {
                                            setState(() {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              show = !show;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.attach_file),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomsheet());
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(7),
                                      ),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, right: 3),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(Icons.mic),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 330,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(17),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icondata(Icons.insert_drive_file, Colors.blue,'Document'),
                  SizedBox(
                    width: 40,
                  ),
                  icondata(Icons.camera_alt, Colors.pink,'Camera'),
                  SizedBox(
                    width: 40,
                  ),
                  icondata(Icons.insert_photo, Colors.purple,'Gallery'),

                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icondata(Icons.headset, Colors.orange,'Audio'),
                  SizedBox(
                    width: 40,
                  ),
                  icondata(Icons.videocam, Colors.blue,'Room'),
                  SizedBox(
                    width: 40,
                  ),


                  icondata(Icons.location_pin, Colors.green,'Location'),


                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60,top: 10),
                child: Row(


                  children: [
                    icondata(Icons.person, Colors.lightBlueAccent,'Contact'),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget icondata(IconData icon,  Color color, String text){
    return Column(
      children: [
        CircleAvatar(
      backgroundColor: color,
          radius: 25,

          child: Icon(icon, size: 29, color: Colors.white,),
          ),
     SizedBox(
       height: 5,
     ),
          

        Text(text, style: TextStyle(
          fontSize: 12
        ),),
      ],

    );
  }
  Widget emojiSelect() {
    return EmojiPicker(onEmojiSelected: (emoji, category) {
      print(emoji);
      setState(() {
        _controller.text = _controller.text + emoji.emoji;
      });
    });
  }
}
