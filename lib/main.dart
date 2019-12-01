import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
  const platform = const MethodChannel('samples.flutter.dev/battery');
  platform.invokeMethod('getBatteryLevel');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'hoge-',
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 400;
    const double itemHeight = 100;
    const double itemWidth = 100;
    const double itemTop = 0;
    const double itemStart = containerWidth - itemWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: containerWidth,
              height: itemHeight,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: itemWidth,
                    height: itemHeight,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                        255,
                        0,
                        255,
                        0,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: itemTop,
                    start: itemStart,
                    child: Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          0,
                          0,
                          255,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  255,
                  255,
                  0,
                  255,
                ),
              ),
            ),
            Container(
              width: containerWidth,
              height: itemHeight,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: itemWidth,
                    height: itemHeight,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                        255,
                        0,
                        255,
                        0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: itemWidth,
                      height: itemHeight,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          0,
                          0,
                          255,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(
                  255,
                  255,
                  0,
                  0,
                ),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () => _incrementCounter(context),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
