import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  var item;
  var index;
   CardBody({Key? key, required this.item, required this.handleDelete, required this.index}) : super(key:key);

   final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: (index % 2 == 0) ? Color.fromARGB(255, 206, 203, 203) : Color.fromARGB(255, 236, 83, 231),
        borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            InkWell(
              onTap: () async {
            if (await confirm(context)) {
              //xoa 1 phan tu trong list
              handleDelete(item.id);
            }
            return;
          },
              child: const Icon(
                Icons.delete_outlined, 
                size: 25,))
          ],
        ),
      ),
    );
  }
}