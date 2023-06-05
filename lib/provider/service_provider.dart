import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/services/todo_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/todo_model.dart';


final serviceprovider=StateProvider<TodoService>((ref) {
  return TodoService();
}

);

 final fetchProvider = StreamProvider<List<TodoModel>>((ref) async* {
  final getData=FirebaseFirestore.instance.collection("todoApp-flutter").snapshots().
  map((event) => event.docs.map((snapshot) => TodoModel.fromSnapshot(snapshot)).toList());
  
  yield* getData;
 });