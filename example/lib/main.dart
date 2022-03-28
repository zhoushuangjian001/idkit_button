import 'package:flutter/material.dart';
import 'package:idkit_button/idkit_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String imgpath = 'https://img0.baidu.com/it/u=2137484864,1681562941&fm=26&fmt=auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          IDKitButton.title(
            'Next',
            bgColor: Colors.blue,
            height: 44,
            enable: false,
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.title(
            'Next',
            height: 44,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.image(
            imgpath,
            width: 100,
            bgColor: Colors.red,
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.imageAndText(
            imgpath,
            'Setup',
            height: 120,
            imgSize: const Size(100, 200),
            bgColor: Colors.blue,
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.corner(
            bgColor: Colors.blue,
            height: 60,
            width: 100,
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.gradient(
            const <Color>[Colors.red, Colors.green],
            width: 200,
            height: 60,
            title: 'Finish',
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton.outline(
            title: 'Border Button',
            padding: const EdgeInsets.all(20),
            onTap: () {
              print('Button on click!');
            },
          ),
          const SizedBox(height: 10),
          IDKitButton(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgpath),
                fit: BoxFit.fill,
              ),
            ),
            title: 'Backgrount button',
            height: 60,
          ),
        ],
      ),
    );
  }
}
