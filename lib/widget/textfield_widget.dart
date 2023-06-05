import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.maxLines,
    required this.txtController,
    required this.onChanged,
  });
final String hintText;
final int maxLines;
final VoidCallback onChanged;
final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Container(
     
    
     decoration: BoxDecoration(
       
       color: Colors.grey.shade200,
       borderRadius: BorderRadius.circular(6)
     ),
     child: TextFormField(
      controller: txtController,
      maxLines: maxLines,
      
      onChanged: (value) {
        onChanged;
      },
      
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
         border: InputBorder.none,
         focusedBorder: InputBorder.none,
         hintText:hintText,
         
       ),
     ));
  }
}