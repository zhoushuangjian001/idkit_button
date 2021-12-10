import 'package:flutter/material.dart';
import 'package:idkit_button/idkit_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  final String imgpath =
      'https://img0.baidu.com/it/u=2137484864,1681562941&fm=26&fmt=auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IDKitButton.title(
                '确定',
                bgColor: Colors.red,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.title(
                '确定',
                bgColor: Colors.green,
                width: 80,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.title(
                '确定',
                bgColor: Colors.purple,
                height: 50,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.title(
                '确定',
                bgColor: Colors.pink,
                height: 60,
                width: 100,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.title(
                '确定',
                bgColor: Colors.yellow,
                margin: const EdgeInsets.all(10),
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.title(
                '确定',
                bgColor: Colors.green,
                padding: const EdgeInsets.all(10),
                onTap: () {
                  print('点击');
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IDKitButton.image(
                imgpath,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.image(
                imgpath,
                width: 100,
                bgColor: Colors.red,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.image(
                imgpath,
                height: 100,
                bgColor: Colors.green,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.image(
                imgpath,
                height: 100,
                width: 100,
                bgColor: Colors.blue,
                onTap: () {
                  print('点击');
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IDKitButton.imageAndText(
                imgpath,
                '图文',
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.imageAndText(
                imgpath,
                '图文',
                width: 100,
                bgColor: Colors.red,
                layout: BtnGraphicLayout.td,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.imageAndText(
                imgpath,
                '图文',
                height: 100,
                bgColor: Colors.yellow,
                layout: BtnGraphicLayout.rl,
                onTap: () {
                  print('点击');
                },
              ),
              IDKitButton.imageAndText(
                imgpath,
                '图文',
                height: 100,
                width: 100,
                bgColor: Colors.greenAccent,
                layout: BtnGraphicLayout.bt,
                onTap: () {
                  print('点击');
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.left,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.right,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.top,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.bottomRight,
                radius: 10,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.topLeft,
                radius: 10,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.topRight,
                radius: 10,
              ),
              IDKitButton.corner(
                title: '图文',
                image: imgpath,
                bgColor: Colors.red,
                cornerType: BtnCornerType.bottomLeft,
                radius: 10,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IDKitButton.gradient(
                [Colors.red, Colors.green],
                width: 100,
                title: '图文',
              ),
              IDKitButton.gradient(
                [Colors.red, Colors.green],
                width: 100,
                height: 100,
                type: BtnGradientType.radial,
                title: '图文',
              ),
              IDKitButton.gradient(
                [Colors.red, Colors.green],
                width: 100,
                height: 100,
                type: BtnGradientType.sweep,
                title: '图文',
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IDKitButton.outline(
                width: 100,
                title: '图文',
              ),
              IDKitButton.outline(
                width: 100,
                height: 100,
                radius: 10,
                borderColor: Colors.red,
                title: '图文',
                bgColor: Colors.green,
              ),
              IDKitButton.outline(
                width: 100,
                height: 100,
                title: '图文',
                radius: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
