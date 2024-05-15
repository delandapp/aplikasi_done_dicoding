import 'package:done_app/data/done.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DonePage extends StatelessWidget {
  List<Task> task; 
  DonePage({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done List'),
      ),
      body: SafeArea(child: ListView(
        children: task.map((e) => ListTask(task: e,)).toList(),
      ),),
    );
  }
}

// ignore: must_be_immutable
class ListTask extends StatelessWidget {
  Task task;
  ListTask({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.red,
      ),
      title: Text(task.title),
      subtitle: Text(task.deskripsi),
      trailing: task.isDone ? const Icon(Icons.check) : const Icon(Icons.done),);
  }
}