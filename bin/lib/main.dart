//import 'dart:html';

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    
  }
}



String? stringResponse;

Map? mapResponse;
Map? dataResponse;
List? listResponse;

mixin map {
}

class HomePage extends StatefulWidget{
  @override
  _HomepageState createState() => _Homepagestate();

 
  _Homepagestate() {}

}



class _HomepageState extends State<HomePage>{
   
   
   Future apicall()async{
    http.Response response;
    response= await http.get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
    if(response.statusCode ==200){
      setState((){
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        var map = mapResponse!;
        dataResponse = map['data'];
      });
    }
   }

   @override
  void initState() {
    apicall();
    super.initState();
  }
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
      ),
      body:  ListView.builder(itemBuilder: (context, index){
        return Container(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
              child: Image.network(listResponse![index]['profile_image']),
              ),
              Text(listResponse![index]['id'].toString()),
              Text(listResponse![index]['name'].toString()),
               Text(listResponse![index]['company']['name'].toString()),

              //Image.network(listResponse![index]['profile_image']),
              //Text(listResponse![index]['id']),
            ],
          ),
        );
      },
      itemCount: listResponse == null? 0: listResponse!.length,
      )
      //Center(child: Container(
      //  height: 200,
      //  width: 300,
      //  decoration: BoxDecoration(
      //    borderRadius: BorderRadius.circular(20), color: Colors.blue),
      //    child: Center(child: dataResponse== null? Container():Text(dataResponse![0]['id'].toString()),
      //  ),
     // ),)
      );
  }
}

mixin Homepage {
}



