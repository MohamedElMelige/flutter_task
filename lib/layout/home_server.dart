import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/models/server_model.dart';
import 'package:flutter_task/shared/componants/default_form_field.dart';
import 'package:flutter_task/shared/cubit/cubit.dart';
import 'package:flutter_task/shared/cubit/state.dart';

import '../shared/componants/constant.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {

   late ServerModel server;

    var scaffoldKey = GlobalKey<ScaffoldState>();

    var formKey = GlobalKey<FormState>();

    var serverName = TextEditingController();

    var ServerId = TextEditingController();

    return BlocConsumer<AppCubit,AppState>(builder:(context,state){
      return Scaffold(

        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor:colorTheme,
          centerTitle: true,
          title: Text('Servers',style: TextStyle(color: Colors.white),),
        ),
       body: Padding(padding: EdgeInsets.all(10),
         child: AppCubit.get(context).server==null? Center(child: Text('No server added'),): null,
       ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (AppCubit.get(context).togle) {
                if (formKey.currentState!.validate()) {
                  AppCubit.get(context).insertServerData(serverName: '$serverName', ServerId: '$ServerId');
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet((BuildContext context) {
                  return Container(
                    width: double.infinity,
                    height: 360,
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultTextFormField(controller: serverName, value:'serverName' , icon: Icons.dataset),
                          DefaultTextFormField(controller: ServerId, value:'Server IP / Domain' , icon: Icons.link)
                        ],
                      ),
                    ),
                  );
                })
                    .closed
                    .then((value) {
                  AppCubit.get(context)
                      .changeIconState(isShow: false, icon: Icons.edit);
                });
                AppCubit.get(context)
                    .changeIconState(isShow: true, icon: Icons.add);
              }
            },
            child: Icon(AppCubit.get(context).febIcon),
          ),
      );
    } , listener: (context,state){});
  }
}


