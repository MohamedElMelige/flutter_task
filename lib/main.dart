

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/layout/login.dart';
import 'package:flutter_task/shared/cubit/cubit.dart';
import 'package:flutter_task/shared/cubit/state.dart';



void main() {
   runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(providers: [  BlocProvider<AppCubit>(
       create: (context) =>
       AppCubit()
         ..initDatabase(),
     ),], child: BlocConsumer<AppCubit,AppState>(
       listener: (context,state){},
       builder: (context,state){
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         home:LogIn(),
       ) ;
     },), );
   }
 }
