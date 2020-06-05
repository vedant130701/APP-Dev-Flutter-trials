import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
 
  List<Color> _colorsb = [ //Get list of colors
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red
    
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            
          new Container(
          width: 180.0,
          height: 180.0,
          decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage(
                 "images/profile1.jpg")
                 )
          )),
            
            Text(
              'Vedant Rishi Das',
              style: TextStyle(
               fontSize: 40,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            ),
            Padding(padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),),
            Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 30,color: Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,)
            ),
            Padding(padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),),

           Padding(padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),),

          Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone_android,
                      color: _colorsb[_currentIndex],
                    ),
                    title: Text(
                      "YOUR PHONE NUMBER",
                      style: TextStyle(color: _colorsb[_currentIndex]),
                    ),
                  ),
                ),
              ),
),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: _colorsb[_currentIndex],
                    ),
                    title: Text(
                      "YOUR EMAIL",
                      style: TextStyle(color: _colorsb[_currentIndex]),
                    ),
                  ),
                ),
              ),
),
            new ButtonTheme.bar(
              child: new ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=0;
                
              });},
              
              color: _colorsb[0],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=1;
              });},
              color: _colorsb[1],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=2;
              });},
              color: _colorsb[2],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=3;
              });},
              color: _colorsb[3],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=4;
              });},
              color: _colorsb[4],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=5;
              });},
              color: _colorsb[5],),
            ),
            Container(
              width: 30,
              child: new RaisedButton(onPressed: (){setState(() {
                _currentIndex=6;
              });},
              color: _colorsb[6],),
            ),
                  ],
        ),
        )
          ],
        ),
      ),
      backgroundColor: _colorsb[_currentIndex],
      
    );
  }
}
