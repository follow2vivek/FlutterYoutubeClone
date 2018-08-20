import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils.dart' as utils;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getYoutubeData(),
      builder: (BuildContext context, AsyncSnapshot<Map> data) {
        if (data.hasData) {

          return Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _row(context, index, data);
              },
              itemCount: 15,
              scrollDirection: Axis.vertical,
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    ));
  }

  Widget _row(BuildContext context, int i, AsyncSnapshot<Map> data) {
    print(data.data);
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              height: 190.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("${data
                      .data['items'][i]['snippet']['thumbnails']['medium']['url']}"),
                  fit: BoxFit.fill,

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2.0)),
                child: Text(
                  "03:38",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${data
                              .data['items'][i]['snippet']['thumbnails']['medium']['url']}"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                width: 240.0,
                child: Text(
                  "${data.data['items'][i]['snippet']['title']}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Container(
                child:
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              )
            ],
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        )
      ],
    );
  }

  Future<Map> getYoutubeData() async {
    http.Response response = await http.get(utils.apiUrl);

    return json.decode(response.body);
  }
}
