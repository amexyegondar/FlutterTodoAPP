import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/provider/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.radioTitle,
    required this.cataColor,
    required this.valueInput,
    required this.onChangevalue,
  });
 final String radioTitle;
 final  Color cataColor;
 final int valueInput;
 final VoidCallback onChangevalue;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final radio=ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.green),
        child: RadioListTile(
          activeColor: cataColor,
          contentPadding: EdgeInsets.all(0),
          title: Transform.translate(
            offset: Offset(-22, 0),
            child: Text(radioTitle,style: TextStyle(
              color: cataColor,fontWeight: FontWeight.w700, 
            ),)),
          value: valueInput, 
          groupValue: radio, 
          onChanged: (value){
             onChangevalue();
        }),
      ),
    );
  }
}

