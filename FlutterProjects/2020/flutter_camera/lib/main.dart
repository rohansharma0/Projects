import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/screens/camera_screen.dart';
import 'package:flutter_camera/screens/main_screen.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Camera App'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Camera',
                ),
                Tab(
                  text: 'Home',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CameraScreen(cameras: cameras),
              MainScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
