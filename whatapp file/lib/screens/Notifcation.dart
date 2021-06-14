
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Notfication extends StatefulWidget {
  @override
  _NotficationState createState() => _NotficationState();
}

class _NotficationState extends State<Notfication> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    // boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.9),
                    //         spreadRadius: 9,
                    //         blurRadius: 19,
                    //         offset: Offset(0, 3), // changes position of shadow
                    //       ),
                    //     ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                       backgroundImage: AssetImage('assets/name.png'),
                        maxRadius: 30.0,
                      ) ,
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('You Have booked Plumber for tab installation on 23/3/2021'),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
