import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]),
            onTap: () {
              // Add functionality to mark todo as complete or navigate to todo details screen
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController todoController = TextEditingController();

        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(hintText: 'Enter your todo'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String todo = todoController.text.trim();
                if (todo.isNotEmpty) {
                  setState(() {
                    todos.add(todo); // Add the todo to the list
                  });
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
