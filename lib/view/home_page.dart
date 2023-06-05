import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/common/show_modal.dart';
import 'package:to_do_app/widget/card_to_do_list_widget.dart';

import '../provider/service_provider.dart';

class HomePage extends ConsumerWidget {
 const  HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final todoData=ref.read(fetchProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.all(0),
          child: ListTile(
            leading: CircleAvatar(
              // child: Image.asset("image/black.png",
              // width: 20,
              // height:20,
            
              // ),
              // radius: 25,
              // backgroundColor: Colors.amber.shade300,
            ),
            title:Text('Hello I\'am',style: TextStyle(fontSize: 12,color: Colors.grey),) ,
            subtitle: Text("Mike ",style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.black),
          ),
        ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.calendar),
                iconSize:16 ,
                color: Colors.black,
                )
                ,IconButton(onPressed: (){}, 
                icon: const Icon(CupertinoIcons.bell),
                 color: Colors.black,
                 iconSize:16 ,

                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today's Task",style: 
                        TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:Colors.black,
                        ),),
                        Text("Thursday 11 june" ,style: TextStyle(color:Colors.grey,fontSize: 12),),
                      ],
                    ),
                    ElevatedButton(onPressed: ()=>showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      context: context, 
                      builder: (context)=>AddNewmodel()), 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5E8FA),
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      
                    ),
                    
                    child: Text("+ New task"
                   ,))
                  ],
      
                ),
                const Gap(10),
                ListView.builder(
                  itemCount:todoData.value?.length ?? 0 ,
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>
                  CardTodoListWidget(getindex: index,)
                  )
              ],
            ), 
          
          ),
        ),
      ),
  
      
    );
  }
}

