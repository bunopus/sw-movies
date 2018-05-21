import 'dart:async';
import 'dart:io';

Future main() async {
  const port = 8000;

  HttpServer server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    port,
  );

  print('Listening on ${port}');

  await for (HttpRequest request in server) {
    request.response
      ..write('Hello, world!')
      ..close();
  }
}

