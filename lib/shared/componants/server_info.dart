import 'package:flutter/material.dart';
import 'package:flutter_task/models/server_model.dart';

class ServerInfo extends StatelessWidget {
  const ServerInfo({
    required this.server,
    required this.text
  });

  final String server;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('text',style: TextStyle(fontWeight: FontWeight.bold),),
            Text("server" )],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(),
      ],
    );
  }
}