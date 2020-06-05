import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wikipedia Summary Searcher',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: MyHomePage(title: 'Wikipedia Search App'),
    
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
       title: Text(widget.title),
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), onPressed: () {
           showSearch(context: context, delegate: DataSearch());
         })
       ],
        
      ),
      drawer: Drawer(),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          new Container(
            height:320,
            width: 320,
            child:new Image(image: new AssetImage('assets/wikilogo.svg.png')),
    
          ),
          Center(
            child: Text("WIKIPEDIA", style: TextStyle( fontSize: 40))
            ),
          Center(
            child: Text("Tap on search bar to search", style: TextStyle( fontSize: 20))
            ),
        ],
      )
      
      
    );
  }
}


class DataSearch extends SearchDelegate<String>{
  final cities = [];
 
  final recentCities = [];
  
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar

    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of appbar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Center(
      child: Container(
        child: FutureBuilder(
             future: Dio().get("http://rixirx.pythonanywhere.com/wiki/$query"),
             
             builder: (context,snapshot){
            if( !snapshot.hasData ) return CircularProgressIndicator();
            else if( snapshot.hasError ) return Text('Error');
            else{
                  Response response = snapshot.data;
                  Map dat = response.data;
                  if(  dat['type'] == 'success'){
                  return ListView(children: <Widget>[ SingleChildScrollView(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("$query",style: TextStyle(fontSize: 40,)  ),
                      Card( 
                        color: Colors.grey,
                        child: Text(dat['result'],style: TextStyle(fontSize: 20, color: Colors.black))
                        ),
                    ],
                  ))]);  
                  }else{
                    return Text('Error');
                  }
             }
          },
          )
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    int cnt = 0;
    for(int i = 0; i< cities.length; ++i){
      if( query ==cities[i] ){
        cnt++;
        break;
      }
    }
    if(cnt == 0 ){
    cities.add(query);
    }
    else{
      cnt = 0;
    }
   //recentCities.add(query);
    final suggestionList = query.isEmpty? recentCities:cities.where((p) => p.startsWith(query)).toList();
    //final suggestionList = recentCities;
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: (){
        
        if(query != "")
        {recentCities.add(query);

        showResults(context);}
        else{
        query = recentCities[index];
        showResults(context);
      }
      },

      leading: Icon(Icons.location_city),
      title : RichText(
        text: TextSpan(
        text: suggestionList[index].substring(0, query.length),
        style: TextStyle(color: Colors.black, fontWeight:  FontWeight.bold,),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey)
        )]
      )),
    
    ),
    itemCount: suggestionList.length,
     );
  }

}

