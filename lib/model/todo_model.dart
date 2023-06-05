// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
   String? docId;
   final String titleTask;
   final String description;
   final String catagory;
   final String dateTask;
   final String timeTask;
   final bool isDone;

  TodoModel(
     {this.docId,
    required this.titleTask,
    required this.description,
    required this.catagory,
    required this.dateTask,
    required this.timeTask,
    required this.isDone,
    }
  );


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'titleTask': titleTask,
      'description': description,
      'catagory': catagory,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isDone':isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docId:map['docId'] != null ? map['docId'] as String : null,
      titleTask:map['titleTask'] as String,
      description:map['description'] as String,
      catagory:['catagory'] as String,
      dateTask:map['dateTask'] as String,
      timeTask:map['timeTask'] as String,
      isDone:map['isDone'] as bool,
    );
  }

 factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String , dynamic>> doc){
    return TodoModel( 
      docId: doc.id,
    titleTask:doc['titleTask'], 
    description:doc['description'], 
    catagory:doc['catagory'], 
    dateTask:doc['dateTask'], 
    timeTask:doc['timeTask'],
    isDone:doc['isDone'],
    );
  }
}
