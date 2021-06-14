import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:whatapp/screens/CameraView.dart';

List<CameraDescription> cameras;


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;
  Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue  = _cameraController.initialize();

  }
  void dispose(){
    super.dispose();
    _cameraController.dispose();
  }
  @override




  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,

              builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return CameraPreview(_cameraController);

              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              }
          ),

          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.flash_off,color: Colors.white,size: 28,), onPressed: (){}),

                      InkWell( 
                        onTap: (){
                          takePhoto(context);
                        },
                       child: Icon(Icons.panorama_fish_eye,size: 70,color: Colors.white,),
                      ),
    

                      IconButton(icon: Icon(Icons.flip_camera_ios,color: Colors.white,size: 28,), onPressed: (){}),

                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void takePhoto(BuildContext context) async {
    final  path = join(( await getTemporaryDirectory()).path,'${DateTime.now()}.png');
      await  _cameraController.takePicture();

     Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraView(
       path: path,
     )));

  }
}
