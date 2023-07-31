import 'package:flutter/material.dart';
import 'package:flutter_todolist/modal/items.dart';
import 'widget/card_body_widget.dart';
import 'widget/card_modal_bottom.dart';

void main(List<String> args) {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final List<DataItems> items = [

   ];

   void _handleAddTasK(String name){
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
   }

   void _handleDeleteTask(String id){
      setState(() {
       items.removeWhere((item) => item.id == id);       
      });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDoList", 
            style: TextStyle(
              fontSize: 40, 
              fontWeight: FontWeight.bold),
              )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: 
            items
            .map((item) => CardBody(
              index : items.indexOf(item),
              item : item, 
              handleDelete: _handleDeleteTask))
            .toList(), 
          ),
             
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(isScrollControlled: true,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context
            , builder: (BuildContext context) {
              return  ModalBottom(addTask: _handleAddTasK);
            });
          },
          child: const Icon(Icons.add, size:40),
        )
    );
  }
}



