import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/todo_model.dart';
class TodoService{
  final todoCollection=FirebaseFirestore.instance.collection("todoApp-flutter");
//crud
//create
  void addNewTask(TodoModel model){
todoCollection.add(model.toMap());
 }

// Update checkbox
void updateTask(String? docID,bool? valueUpdate) {
  todoCollection.doc(docID).update(
    {
      "isDone":valueUpdate,
      }

  );
}
//delete Task
void deleteTask(String? docID){
  todoCollection.doc(docID).delete();
}
}