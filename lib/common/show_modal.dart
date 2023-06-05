import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/contant/app_style.dart';
import 'package:to_do_app/provider/date_time_provider.dart';
import 'package:to_do_app/widget/date_time_widget.dart';

import '../provider/radio_provider.dart';
import '../provider/service_provider.dart';
import '../provider/title_description_provider.dart';
import '../widget/radio_widget.dart';
import '../widget/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/todo_model.dart';
class AddNewmodel extends ConsumerWidget {
   AddNewmodel({
    super.key,
  });
final TextEditingController titleController=TextEditingController();
final TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
   final dateProv=ref.watch(dateProvider);
    return Container(
      margin: EdgeInsets.only(left: 3),
      height: MediaQuery.of(context).size.height*0.85,
      decoration: BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(16),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
       SizedBox(
        width: double.infinity,
        child: Text("New Task Todo", 
        textAlign: TextAlign.center,
        style:TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        )
        )),
       Divider(
        thickness: 1.2,
        color: Colors.grey.shade200,
       ),
       const Gap(12),
       Text("Title task",
      style: AppStyle.headingstyle,
       ),
       const Gap(3),
       TextFieldWidget(hintText: "Add new task ...",maxLines: 1, txtController: titleController, 
       onChanged: () { 
        ref.read(titleProvider.notifier).update((state) => titleController.text);
        },),
       const Gap(6),
       Text("Description", style: AppStyle.headingstyle,),
       TextFieldWidget(hintText: "Add description...",maxLines: 3, txtController: descriptionController, 
       onChanged: () { 
       ref.read(descriptionProvider.notifier).update((state) => descriptionController.text);

        },),
       const Gap(6),
      Text("Catagory", style: AppStyle.headingstyle,),
      Row(
        children: [
          Expanded(
            child: RadioWidget(cataColor: Colors.green,radioTitle: "LRN"
            ,valueInput: 1,
            onChangevalue: () => ref.read(radioProvider.notifier).update((state) => 1),
            )
            ),
           Expanded(
            child: RadioWidget(cataColor: Colors.blueAccent,radioTitle: "WRK",
            valueInput: 2,
            onChangevalue: () => ref.read(radioProvider.notifier).update((state) => 2),
            )
            ),
           Expanded(
            child: RadioWidget(cataColor: Colors.amberAccent.shade700,radioTitle: "GEN"
            ,valueInput: 3,
            onChangevalue: () => ref.read(radioProvider.notifier).update((state) => 3),
            )
            ),    
        ],
      ),
      //Date and time
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateTimeWidget(
            iconSection: CupertinoIcons.calendar,
            titleText: "Date",
            valueText: dateProv,
             onTap: () async{
            final getvalue=await   showDatePicker(context: context, initialDate: DateTime.now(), 
             firstDate: DateTime(2021), 
             lastDate: DateTime(2025));
             if(getvalue!=null){
              final format=DateFormat.yMd();
             
              ref.read(dateProvider.notifier).update((state) => format.format(getvalue));

             }
             },

          ),
          Gap(22),
        DateTimeWidget(
          iconSection: CupertinoIcons.clock,
          titleText: "Time",
          valueText: ref.watch(timeProvider), 
          onTap: () async {
            final gettime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
            if(gettime!=null){
            final format=TimeOfDayFormat.H_colon_mm;
            ref.read(timeProvider.notifier).update((state) => gettime.format(context));
            }
          },),

        ],
      )
, Gap(8),
      // Button Section
      Row(
        children: [
          Expanded(
            flex: 4,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.white ,
              foregroundColor:Colors.blue.shade800,
              elevation: 0,
              side: BorderSide(color: Colors.blue.shade800),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ,padding: EdgeInsets.symmetric(vertical: 14)
            ),
            
            child: Text("Cancel"),
            
            ),
          ),
          Gap(20),
          Expanded(
             flex: 4,
            child: ElevatedButton(
              onPressed: (){
               
                final getRadiovalue=ref.watch(radioProvider);
                String catagory='';
                switch(getRadiovalue){
                  case 1:
                       catagory='Learning';
                       break;
                  case 2:
                       catagory='working';
                       break;
                  case 3:
                       catagory='General';
                       break;          
                }
      ref.read(serviceprovider).addNewTask(
                  TodoModel(
                    titleTask: titleController.text, 
                    description: descriptionController.text,
                     catagory: catagory, dateTask: 
                     ref.read(dateProvider), 
                     timeTask: ref.read(timeProvider),
                     isDone:false,
                     ));
          //   FirebaseFirestore.instance.collection('todoApp-flutter').add(
          //     {
          //     'titleTask':titleController.text,
          //     "description":descriptionController.text,
          //     'catagory':catagory,
          //     "timeTask":ref.read(timeProvider),
          //     "dateTask":ref.read(dateProvider),


          //     }


          //   ).then((value){
          //     Navigator.pop(context);
          //     print("Task Added");
          //   } )
          // .catchError((error) => print("unable to add task: $error"));
          Navigator.pop(context);
          print("Task Added");
          
          titleController.clear();
          descriptionController.clear();
          ref.read(radioProvider.notifier).update((state) => 0);
          ref.read(dateProvider.notifier).update((state) => "mm/dd/yy");
          ref.read(timeProvider.notifier).update((state) => "hh:mm");
         }, 
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.blue.shade800 ,
              foregroundColor:Colors.white,
              elevation: 0,
              side: BorderSide(color: Colors.blue.shade800),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ,padding: EdgeInsets.symmetric(vertical: 14)
            ),
            
            child: Text("Create"),
            
            ),
          ),
          Expanded(
            flex: 1,
            child: 
          
          Gap(1),
          )
        ],
      )




        ]
        

      )
    );
  }
}

