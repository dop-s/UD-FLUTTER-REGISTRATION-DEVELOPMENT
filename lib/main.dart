import 'package:flutter/material.dart';
import 'package:registration_development/provider/notesprovider.dart';
import 'package:registration_development/routes/app_routes.dart';
import 'package:registration_development/views/notes_form.dart';
import 'package:registration_development/views/notes_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NotesProviders(),
        )
      ],
      child: MaterialApp(
        // Banner padrão removido
        debugShowCheckedModeBanner: false,
        title: 'Daily Note ',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => NotesList(),
          AppRoutes.NOTES_FORM: (_) => NotesForm()
        },
      ),
    );
  }
}
