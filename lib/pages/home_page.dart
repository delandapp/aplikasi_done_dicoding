import 'package:done_app/data/done.dart';
import 'package:done_app/pages/done_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> task = [
    Task(title: 'Belajar Set State', deskripsi: 'Belajar Set State', isDone: false),
    Task(title: 'Belajar Set State 2', deskripsi: 'Belajar Set State 2', isDone: false),
    Task(title: 'Belajar Set State 3', deskripsi: 'Belajar Set State 3', isDone: false),
    Task(title: 'Belajar Set State 4', deskripsi: 'Belajar Set State 4', isDone: false),
    Task(title: 'Belajar Set State 5', deskripsi: 'Belajar Set State 5', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Set State'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage(task: task.where((task) => task.isDone).toList(),)));
            },
            icon: const Icon(Icons.done_all),
          )
        ],
      ),
      body: SafeArea(child: ListView(
        children: task.map((e) => ListTask(task: e,)).toList(),
      ),),
    );
  }
}

// ignore: must_be_immutable
class ListTask extends StatefulWidget {
  Task task;
  ListTask({super.key,required this.task});

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.red,
      ),
      title: Text(widget.task.title),
      subtitle: Text(widget.task.deskripsi),
      trailing: widget.task.isDone ? const Icon(Icons.check) : IconButton(onPressed: (){setState(() {
        widget.task.toggleDone(widget.task);
      });}, icon: const Icon(CupertinoIcons.add_circled_solid)),
    );
  }
}