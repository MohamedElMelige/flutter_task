import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/models/server_model.dart';
import 'package:flutter_task/shared/cubit/cubit.dart';
import 'package:flutter_task/shared/cubit/state.dart';

import 'server_info.dart';

class ServerWidget extends StatelessWidget {
  const ServerWidget({required this.server});
  final ServerModel server;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      builder: (context, state){
        return Column(
          children: [
            ServerInfo(server:'${server.serverName}',text: 'Server Name',),
            ServerInfo(server:'${server.serverUrl}',text: 'Server IP / Domain',),
            ServerInfo(server:'${server.isDefault}',text: 'Server default',),
          ],
        );
      },
      listener: (context,state){},);
  }
}


