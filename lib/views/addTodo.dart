import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/food.dart';

class addTodo extends StatelessWidget {
  var judulController = TextEditingController();
  var deskripsiController = TextEditingController();
  final Function insertFunction;

  addTodo({required this.insertFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: Text('TODO  Tugas')),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: judulController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Judul',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: deskripsiController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deskripsi',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    var food = Food(
                      judul: judulController.text,
                      deskripsi: deskripsiController.text,
                      isDone: false,
                    );
                    insertFunction(food);
                    Navigator.pop(context);
                  },
                  child: Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
