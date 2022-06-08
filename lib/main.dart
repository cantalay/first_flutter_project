import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.brown,
      ),
      home: LoginPage(
        title: "Hello App",
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var horizontalPosition = 250.0;

  @override
  Widget build(BuildContext context) {


    Stack someStack = Stack(
      children: [Container(width: MediaQuery.of(context).size.width, height: 10.0, color: Colors.blue,),
        Positioned(
            top: horizontalPosition,
            child: Container(width: MediaQuery.of(context).size.width, height: 50.0, color: Colors.red,)),
      ],
    );
    GestureDetector someGestureDetector = GestureDetector(
      child: someStack,
      onHorizontalDragUpdate: (DragUpdateDetails dd) {
        print(dd.localPosition.dy);
        print(MediaQuery.of(context).size.height);
        setState(() {
          horizontalPosition = dd.localPosition.dy;
        });
      },
    );

    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,children: [Container(width: MediaQuery.of(context).size.width, height: horizontalPosition, color: Colors.yellow,), someGestureDetector,Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height -horizontalPosition, color: Colors.black,) ],);
  }
}
