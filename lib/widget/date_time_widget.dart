import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/contant/app_style.dart';

class DateTimeWidget extends ConsumerWidget {
  const DateTimeWidget({
    super.key,
    required this.titleText,
    required this.iconSection,
    required this.valueText,
    required this.onTap,
  });
 final String titleText;
 final IconData iconSection;
 final String valueText;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(titleText,
        style: AppStyle.headingstyle,),
        Gap(3),
        Material(
          child: Ink(
            
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8)
            ),
            child: InkWell( 
              borderRadius: BorderRadius.circular(8),
              onTap:()=> onTap(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.transparent
                ,borderRadius: BorderRadius.circular(8),
                  
                ),
                child: Row(
                  children: [
                    Icon(iconSection),
                    Gap(6),
                    Text(valueText)
                  ],
                ),
                
              ),
            ),
          ),
        )
    
    
    
      ]),
    );
  }
}

