import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> generatePdfFromUrl(String url) async {
  var response = await http.get(url);

  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;

  var targetFileName = "${DateTime.now().toString()}";

  await FlutterHtmlToPdf.convertFromHtmlContent(response.body, tempPath, targetFileName);

  OpenFile.open('$tempPath/$targetFileName.pdf');
}
