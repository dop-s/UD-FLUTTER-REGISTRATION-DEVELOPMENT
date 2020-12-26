import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_development/models/notes.dart';
import 'package:registration_development/provider/notesprovider.dart';

class NotesForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Registros'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<NotesProviders>(context, listen: false).put(
                  Notes(
                    id: _formData['id'],
                    assunto: _formData['assunto'],
                    texto: _formData['texto'],
                    avatarURL: _formData['avatarURl'],
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        key: _form,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Assunto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Erro';
                  }

                  if (value.trim().length < 1) {
                    return 'Assunto precisa ter mais que 1 caracteres';
                  }
                },
                onSaved: (value) => _formData['assunto'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Texto'),
                onSaved: (value) => _formData['texto'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL Avatar'),
                onSaved: (value) => _formData['avatarURL'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
