
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/shared/cubit/state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../../models/server_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database database;
  List<ServerModel> server=[];
  bool togle = false;
  IconData febIcon = Icons.edit;


  void initDatabase() async{
    var databasePath=await getDatabasesPath();
    String path=p.join(databasePath, 'users.db');

          openAppDatabase(path:path,);
    emit(AppDatabaseInitialized());
  }
  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE AllTasks (id INTEGER PRIMARY KEY,'
              ' userName TEXT,'
              'password TEXT,'
              'serverName TEXT,'
              'serverId TEXT,'
              'isDefault bool',
        );

        print('Table Created');
      },
      onOpen: (Database db) {
        print('AppDatabaseOpened');
        database = db;
        getAllServers(database);
      },
    );
  }

  void insertServerData({
    required String serverName,
    required String ServerId,
  }) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO AllTasks(serverName,ServerId) VALUES("$serverName","$ServerId")');
      print('inserted1: $id1');
    });
    getAllServers(database);

    emit(InsertDatabaseState());
  }

  void deleteData({required int id})async{
    database.rawDelete('DELETE FROM tasks WHERE id =?',[id]).then((value) {
      getAllServers(database);
      emit(DeleteDatabaseState());
    });
  }

  List<ServerModel> servers = [];

  void getAllServers(database) async {
    servers = [];
    emit(GetLoadingDatabaseState());
    database.rawQuery('SELECT * FROM AllTasks').then((value) {
      value.forEach((element) {
        servers.add(ServerModel.fromJson(element));
      });
      emit(GetDatabaseState());
    });
  }
  void updateServerData({
    required String serverName,
    required String ServerId,
  }) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawUpdate(
          'UPDATE AllTasks SET serverName = ?, ServerId = ? WHERE id = ?',
          ['$serverName', '$ServerId',]);
      print('updated1: $id1');
    });
    getAllServers(database);
    emit(EditDatabaseState());
  }

  void login({
    required String userName,
    required String Password,
  }) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawUpdate(
          'UPDATE AllTasks SET userName = ?, Password = ? WHERE id = ?',
          ['$userName', '$Password',]);
      print('updated1: $id1');
    });
    getAllServers(database);
    emit(EditDatabaseState());
  }

  void changeIconState({required bool isShow, required IconData icon}) {
    togle = isShow;
    febIcon = icon;
    emit(ChangeIconState());
  }
}

