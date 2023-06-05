// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/provider/service_provider.dart';
import 'package:flutter/cupertino.dart';
class CardTodoListWidget extends ConsumerWidget {
  const CardTodoListWidget({
    super.key,
   required this.getindex,
  });
 final int getindex;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todoData=ref.read(fetchProvider);
  return todoData.when(data: 
  (TodoData) { 
    Color catagoryColor=Colors.white;
    final getCatagory=TodoData[getindex].catagory;
    switch(getCatagory){
         case 'Learning':
              catagoryColor=Colors.green;
              break;
         case 'working':
              catagoryColor=Colors.blue; 
              break;
         case 'General':
              catagoryColor=Colors.amber; 
              break; 
  
    }
    return Container(
     margin: EdgeInsets.symmetric(vertical: 4),
      width: 500,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
     child: Row(
      children: [
        Container(
          width: 10,
          decoration:BoxDecoration(
            
            color:catagoryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ) ,
      
        ),
        Expanded(
          child: 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          ListTile(
            leading: IconButton(icon:Icon(CupertinoIcons.delete),
            onPressed: (){
              ref.read(serviceprovider).deleteTask(TodoData[getindex].docId);
            },
            ),
            title: Text(TodoData[getindex].titleTask,
            
            
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
            ,
            decoration: TodoData[getindex].isDone ? TextDecoration.lineThrough : null,
            ),),
            subtitle: Text(TodoData[getindex].description
            ,style: TextStyle(
              fontSize: 15,
              
            ),),
          trailing: Checkbox(
            activeColor: Colors.blue.shade800,
            shape: CircleBorder(),
            value: TodoData[getindex].isDone, 
            onChanged: (value){
              ref.read(serviceprovider).updateTask(TodoData[getindex].docId, value);
            }),
          ),
          Transform.translate(
            offset: Offset(0, -12),
            child: Container(
              child:Column(
                children: [
                  Divider(
              thickness: 1.5,
              color:Colors.grey.shade200
            ),
            Row(
              children: [
                Text("Today",
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                
              )),
                Gap(20),
                Text(TodoData[getindex].timeTask,
                style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                
              ))
              ],
            )
                ],
              )
            ),
          )
            ],
          ),  
            )
        
        )
      ],
     ), 
    );},
   error: (error,StackTrace)=>Center(child: Text("Error"),), 
   loading:()=>Center(
    child: CircularProgressIndicator(),
   ) );
   
  }}
