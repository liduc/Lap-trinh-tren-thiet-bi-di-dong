import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/note.dart';

class NotePage extends StatefulWidget{
  const NotePage({super.key});

  @override
  _Note createState() => _Note();
}

class _Note extends State<NotePage> {
  late Future<List<Note>> notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: FutureBuilder<List<Note>>(
          future: notes,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Text('Lỗi: ${snapshot.error}');
            }
            else if(snapshot.hasData){
              List<Note> notes = snapshot.data!;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(notes[index].title),
                    subtitle: Text(notes[index].content),
                  );
                },
              );
            }
            else {
              return const Text('Không có dữ liệu');
            }
          }),
      ),
    );
  }

}