import 'package:flutter/cupertino.dart';

class Notes {
  final String id;
  final String assunto;
  final String texto;
  final String avatarURL;

  const Notes({
    this.id,
    @required this.assunto,
    @required this.texto,
    @required this.avatarURL,
  });
}