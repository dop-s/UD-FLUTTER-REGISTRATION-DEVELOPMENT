import 'package:flutter/material.dart';
import 'package:registration_development/components/notes_tile.dart';
import 'package:registration_development/provider/notesprovider.dart';
import 'package:provider/provider.dart';
import 'package:registration_development/routes/app_routes.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final notes = {...DUMMY_NOTES};
    final notes = Provider.of<NotesProviders>(context);
    // final NotesProviders notesProviders= Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.NOTES_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: notes.count,
        itemBuilder: (ctx, i) => NotesTile(notes.byIndex(i)),
      ),
    );
  }
}
