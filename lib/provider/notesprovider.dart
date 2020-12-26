import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:registration_development/data/drummy_notes.dart';
import 'package:registration_development/models/notes.dart';

class NotesProviders with ChangeNotifier {
  Map<String, Notes> _items = {...DUMMY_NOTES};

  List<Notes> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Notes byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Notes notes) {
    if (notes == null) {
      return;
    }

    // ATULIZA REGISTRO
    if (notes.id != null &&
        notes.id.trim().isNotEmpty &&
        _items.containsKey(notes.id)) {
      _items.update(
        notes.id,
        (_) => Notes(
          id: notes.id,
          assunto: notes.assunto,
          texto: notes.texto,
          avatarURL: notes.avatarURL,
        ),
      );
    } else {
      //ADD NOVO REGISTRO
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Notes(
          id: id,
          assunto: notes.assunto,
          texto: notes.texto,
          avatarURL: notes.avatarURL,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Notes notes) {
    if (notes != null && notes.id != null) {
      _items.remove(notes.id);
      notifyListeners();
    }
  }
}
