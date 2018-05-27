import 'dart:convert';

strToBase64(String poster) => base64.decode(poster
    .replaceAll('data:image/png;base64,', '')
    .replaceAll('data:image/jpeg;base64,', '')
);
