import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: ToDoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> todos = [];

  void _addTask() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      todos.add({
        "title": _controller.text.trim(),
        "isDone": false,
      });
      _controller.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      todos[index]["isDone"] = !todos[index]["isDone"];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 To-Do List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input tugas
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tulis tugas baru...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 8),
                // 🔵 Tombol + (Floating Style)
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.indigo,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: _addTask,
                    tooltip: 'Tambah Tugas',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

         
            Expanded(
              child: todos.isEmpty
                  ? const Center(
                      child: Text(
                        "Belum ada tugas 😊",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final task = todos[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Checkbox(
                              value: task["isDone"],
                              onChanged: (_) => _toggleTask(index),
                            ),
                            title: Text(
                              task["title"],
                              style: TextStyle(
                                fontSize: 18,
                                decoration: task["isDone"]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteTask(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

   
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}