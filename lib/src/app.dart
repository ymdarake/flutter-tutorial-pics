import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  fetchImage() async {
    ++counter;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
      ),
    );
  }
}
