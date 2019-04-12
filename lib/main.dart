import 'package:flutter/material.dart';

void main() => runApp( TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(title: 'Todo List', home:  TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() =>  TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  // This will be called each time the + button is pressed
  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return  ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return  ListTile(
        title:  Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:  Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton:  FloatingActionButton(
          onPressed:
              _pushAddTodoScreen, // pressing this button now opens the new screen
          tooltip: 'Add task',
          child:  Icon(Icons.add)),
    );
  }

  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well
        // as adding a back button to close it
         MaterialPageRoute(builder: (context) {
      String val1 = "";
      return  Scaffold(
          appBar:  AppBar(title:  Text('Add a new task')),
          body: Column(
            children: <Widget>[
               TextField(
                autofocus: true,
                onChanged: (text) {
                  val1 = text;
                },
                decoration:  InputDecoration(
                    hintText: 'Enter something to do...',
                    contentPadding: const EdgeInsets.all(16.0)),
              ),
              RaisedButton(
                onPressed: () {
                  _addTodoItem(val1);
                  Navigator.pop(context);
                },
                child: Text('i guess'),
              )
            ],
          ));
    }));
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
              title:  Text('Mark "${_todoItems[index]}" as done?'),
              actions: <Widget>[
                 FlatButton(
                    child:  Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                 FlatButton(
                    child:  Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
