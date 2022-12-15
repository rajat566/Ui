import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ui/Models/userlist_model.dart';

class Blog extends StatefulWidget {
  const Blog({Key key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

Future<Userlist> getproductapi() async {
  final response = await http.get(Uri.parse(
      'https://gravitinfosystems.com/Development/Astrolekha2/Admin/API_Call/GetAstrologers?{Token= DhklSUpo98DBI%26HJ|!@%23jkkh%23GSHG78927Fhfs76&Type=Chat&Category=All&Selected_Cat=1'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return Userlist.fromJson(data);
  } else {
    return Userlist.fromJson(data);
  }
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          backgroundColor: Color.fromARGB(255, 248, 99, 114),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<Userlist>(
                  future: getproductapi(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.astrologers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Text(
                                  "${snapshot.data.astrologers[index].lastName.toString()}"),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ));
  }
}
