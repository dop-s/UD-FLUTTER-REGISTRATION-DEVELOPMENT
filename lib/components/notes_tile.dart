import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_development/models/notes.dart';
import 'package:registration_development/routes/app_routes.dart';

class NotesTile extends StatelessWidget {
  final Notes notes;

  const NotesTile(this.notes);

  @override
  Widget build(BuildContext context) {
    final avatar = notes.avatarURL == null || notes.avatarURL.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(notes.avatarURL));

    return ListTile(
      leading: avatar,
      title: Text(notes.assunto),
      subtitle: Text(notes.texto),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue[900],
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.NOTES_FORM,
                  arguments: notes,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red[700],
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
