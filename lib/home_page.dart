import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxtodo/text_field.dart';
import 'package:getxtodo/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController todoController = TextEditingController();

  final GetXTodo getXTodo = Get.put(GetXTodo());

  // int mIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final isPage = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (todoController.text.isNotEmpty) {
            getXTodo.addToDo(todo: todoController.text);
            todoController.clear();
          } else {
            Get.snackbar("Error", "Todo not added todo is empty");
          }
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFields(todoController: todoController),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: getXTodo.todoList.length,
                  itemBuilder: (context, index) {
                    var todos = getXTodo.todoList[index];
                    return ListTile(
                      leading: Text("$index"),
                      title: Text(todos),
                      trailing: IconButton(
                        onPressed: () {
                          getXTodo.deleteTodo(mIndex: index);
                        },
                        icon: Icon(Icons.delete),
                      ),

                      onTap: () {
                        todoController.text = getXTodo.updateTodo(
                          updateTodo: todoController.text,
                          mIndex: index,
                        );
                        todoController.clear();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
