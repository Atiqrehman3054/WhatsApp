import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key key,this.path}): super(key: key);
  final String path;
  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [

          IconButton(icon: Icon(Icons.crop_rotate,size: 27, color: Colors.white,) ),

          IconButton(icon: Icon(Icons.emoji_emotions_outlined,size: 27, color: Colors.white)),

          IconButton(icon: Icon(Icons.title,size: 27,  color: Colors.white)),
          IconButton(icon: Icon(Icons.edit,size: 27,  color: Colors.white)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
     child: Stack(
       children: [
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height-150,
           child: Image.file(
             File(path),
             fit: BoxFit.cover ,
           ),

         ),
         Positioned(
           bottom: 0,
           child: Container(
             color: Colors.black38,
             width: MediaQuery.of(context).size.width,
             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
             child: TextFormField(
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 17,
               ),
               maxLines: 6,
               minLines: 1,
               decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: "Add Caption....",
                   prefixIcon: Icon(
                     Icons.add_photo_alternate,
                     color: Colors.white,
                     size: 27,
                   ),
                   hintStyle: TextStyle(
                     color: Colors.white,
                     fontSize: 17,
                   ),
                   suffixIcon: CircleAvatar(
                     radius: 27,
                     backgroundColor: Colors.tealAccent[700],
                     child: Icon(
                       Icons.check,
                       color: Colors.white,
                       size: 27,
                     ),
                   )),
             ),
           ),
         ),
       ],
     ),
      ),
    ));

  }
}
