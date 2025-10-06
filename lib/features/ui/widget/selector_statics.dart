import 'package:flutter/material.dart';

class SelectorStatics extends StatefulWidget {
  const SelectorStatics({super.key});

  @override
  State<SelectorStatics> createState() => _SelectorStaticsState();
}

class _SelectorStaticsState extends State<SelectorStatics> {
  int selectIndex = 0;
  final List<String> items = ["Week", "Month", "Year", "All"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(items.length, (index) {
        final isSelected = index == selectIndex;
        return SizedBox(
          height: 70,
          width: 80,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index ;
              });
            },
            child: Card(
              elevation: 4,
              color:isSelected ? Colors.green :  Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Center(child: Text(items[index] , style: TextStyle(
                color: isSelected ? Colors.white : Colors.black , 
              ),)),
            ),
          ),
        );
      }),
    );
  }
}
