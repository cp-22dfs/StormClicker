import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  final handler = (Request req) => Response.ok('✅ Serveur Dart ClickStorm en ligne !');

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('✅ Serveur lancé sur http://localhost:$port');
}
