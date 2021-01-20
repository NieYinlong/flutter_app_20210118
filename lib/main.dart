import 'package:flutter/material.dart';
import 'package:deviceinfo/deviceinfo.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _systemVersion = '';
  String _batteryLevel = '';

  @override
  void initState() {
    initSysVersion();
    super.initState();
  }

  initSysVersion() async {
    String version =  await Deviceinfo.systemVersion;
    String batteryLevel = await Deviceinfo.batteryLevel;
    setState(() {
      _systemVersion = version;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('系统版本: $_systemVersion'),
              Text('手机电量: $_batteryLevel')
            ],
          ),
      ),
    );
  }
}
