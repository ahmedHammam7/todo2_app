import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Bloc/TodoStates.dart';



class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitialState());
  Database? database;
  Database? Db;
  Database? Gt;

  void CreateDataBase()async{
     database =await openDatabase("todo.db",
      version: 1,
    onCreate:  (db, version) {
      db.execute("CREATE TABLE task(id INTEGER PRIMARY KEY,title TEXT,body TEXT,date TEXT,time TEXT,Status TEXT)")
          .then((value) {emit(createTableSuccessState());})
          .catchError((error){
            print(error.toString());
            emit(createTableErrorState());
      });
    },
    onOpen: (db) {
       Db=db;
      print("database opened");
    },).then((value) {
      Gt=value;
     });
  }
  void InsertDataBase(String title,String body,String date,String time )async{

   await Db?.transaction((txn) {
     return txn.rawInsert('INSERT INTO  task(title,body,date,time) VALUES("$title","$body","$date","$time")').then((value) {
        emit(InsertDataSuccessState());

      }).catchError((error){
            print(error.toString());
            emit(InsertDataErrorState());
      });
    }).then((value) {
      GetDataBase();
   });
  }

  List<Map>tasks1=[];
void GetDataBase(){
  Gt?.rawQuery('SELECT * FROM task')
      .then((value) {
    tasks1=value;
    emit(GetDataSuccessState());
  })
      .catchError((error){
    print(error.toString());
    emit(GetDataErrorState());
  });
}
void deleteDataBaseRecord(String body){
  Gt?.rawDelete('DELETE FROM task WHERE body="$body"').then((value) {
    GetDataBase();
    emit(DeleteRecordSuccessState());
  })
      .catchError((error){
        emit(DeleteRecordErrorState());
  });
}
@override
  void onChange(Change<TodoState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
