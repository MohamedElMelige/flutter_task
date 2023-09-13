import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/shared/componants/server_widget.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class ServerModule extends StatelessWidget {
  const ServerModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(

      builder: (BuildContext context, AppState state) {
        return ListView.separated(itemBuilder: (context, index) =>
            ServerWidget(server: AppCubit.get(context).server[index],),  separatorBuilder: (context, index) => const SizedBox(
          width: double.infinity,
          height: 5.5,
        ), itemCount: AppCubit.get(context).server.length) ;
      },
      listener: (BuildContext context, AppState state) {  },

    );
  }
}
