import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({
    super.key,
    required this.addTask,
  });
final Function addTask;
  // String textValue = "";
  TextEditingController controller = TextEditingController();
  void _handleOnclick(BuildContext context) {
      final name = controller.text;
      if(name.isEmpty){
        return;
      }
      addTask(name);

      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             TextField(
              //giá trị nhận từ textValue
              // onChanged: (text) {
              //   textValue = text;
              // } ,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input ur Task",
              ),
            ),
            const SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            height: 50,
          
            child: ElevatedButton(
              onPressed: () => _handleOnclick(context), 
              child: const Text(
                "Add Task", 
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}