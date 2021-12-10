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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IDKitButton(
              bgColor: Colors.red,
            ),
            IDKitButton(
              width: 200,
              bgColor: Colors.green,
              onTap: () {
                print('xxx');
              },
              image:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fbd%2Fd1%2F05%2Fbdd105208ad77d518d21d5ca48aa214f.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641632244&t=506f8cbec3234768506e239a4c3c5a64',
            ),
            IDKitButton(
              width: 200,
              bgColor: Colors.green,
              title: '美女',
              image:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fbd%2Fd1%2F05%2Fbdd105208ad77d518d21d5ca48aa214f.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641632244&t=506f8cbec3234768506e239a4c3c5a64',
            ),
            IDKitButton(
              height: 200,
              bgColor: Colors.pink,
              layout: BtnGraphicLayout.rl,
              title: '美女',
              image:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fbd%2Fd1%2F05%2Fbdd105208ad77d518d21d5ca48aa214f.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641632244&t=506f8cbec3234768506e239a4c3c5a64',
            ),
            IDKitButton(
              height: 200,
              width: 300,
              bgColor: Colors.pink,
              layout: BtnGraphicLayout.td,
              title: '美女',
              image:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fbd%2Fd1%2F05%2Fbdd105208ad77d518d21d5ca48aa214f.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641632244&t=506f8cbec3234768506e239a4c3c5a64',
            ),
            IDKitButton(
              height: 200,
              width: 300,
              bgColor: Colors.pink,
              layout: BtnGraphicLayout.dt,
              title: '美女',
              image:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Fbd%2Fd1%2F05%2Fbdd105208ad77d518d21d5ca48aa214f.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1641632244&t=506f8cbec3234768506e239a4c3c5a64',
            ),
          ],
        ),
      ),
    );
  }
}
