import 'dart:developer';

import 'package:get/get.dart';

class GetXTodo extends GetxController {
  RxList todoList = <String>[].obs;

  List addToDo({required String todo}) {
    todoList.add(todo);
    return todoList;
  }

  updateTodo({required String updateTodo, required int mIndex}) {
    if (todoList.isNotEmpty) {
      todoList[mIndex] = updateTodo;
    } else {
      log("not update todo error");
    }
  }

  List deleteTodo({required int mIndex}) {
    if (todoList.isNotEmpty) {
      todoList.removeAt(mIndex);
    } else {
      log("not update todo error");
    }

    return todoList;
  }
}
