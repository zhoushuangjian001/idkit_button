import 'package:flutter/material.dart';
import 'package:idkit_button/base_button.dart';
import 'package:idkit_button/idkit_button.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 300,
          ),
          Container(
            width: 100,
            color: Colors.green,
          ),
          IDKitDeclineTimeButton(
            width: 100,
            bgColor: Colors.red,
            height: 200,
            title: "发送验证码",
            lifte: true,
            timingTitle: "已发送 %T",
            onTap: (start) {
              print("事件触发");
              Future.delayed(Duration(seconds: 1), () {
                start(true);
              });
              print("结束");
            },
            resetState: (resetBlock) {
              print("事件触发----");
              Future.delayed(Duration(seconds: 36), () {
                resetBlock(true);
              });
            },
          ),
        ],
      ),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 300,
          ),
          IDKitButton(
            height: 120,
            width: 200,
            bgColor: Colors.black,
            radiusInsets: RadiusInsets.all(10),
            gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
              Colors.red,
              Colors.purple,
            ], stops: [
              0.3,
              0.7,
            ]),
            margin: EdgeInsets.all(10),
            title: "发送证吗发送证吗发送证吗发送证吗发送证吗发送证吗",
            style: TextStyle(
              fontSize: 20,
            ),
            overflow: TextOverflow.clip,
            maxLine: 3,
            image: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603967581274&di=82a4ab232dfcbc9939710cd26313a6ef&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3471750117%2C3698950683%26fm%3D214%26gp%3D0.jpg",
                scale: 2),
            imageSize: Size(20, 20),
            sketchLayout: SketchLayout.td,
            onTap: () {
              print("我被点击了");
            },
            isRepeatClick: false,
            onLongPressTitleColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
