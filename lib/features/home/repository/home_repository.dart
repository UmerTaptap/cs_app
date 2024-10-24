import 'dart:io';

import 'package:cs_app/config/network/api.dart';
import 'package:cs_app/core/type_def/type_def.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/response/api_failure_response.dart';

class HomeRepository {
  final Api _api;
  final _gemini = Gemini.instance;

  HomeRepository(this._api);

  ER<String> getMessageResponse ({ required String message }) async {
    try {

      var body = {
        "prompt": message,
        "user_id": "03402093883"
      };

      var response = await _api.post('http://3.231.226.141:5002/api', body);
      print(response.data);


      if(response.statusCode != 200) {
        return Right(response.statusMessage ?? "Sorry, I don't understand");
      }else{
        return Right(response.data['message']);
      }
    } catch (e) {
      return Left(Failure("Sorry, I don't understand"));
    }
  }

  Future<File> loadFile({ required String name }) async {
    // Load the PDF file as bytes from the assets
    final byteData = await rootBundle.load('assets/$name');

    // Get the temporary directory where the file will be written
    final tempDir = await getTemporaryDirectory();

    // Create a temporary file path for the PDF file
    final tempFile = File('${tempDir.path}/$name');

    // Write the bytes to the file
    await tempFile.writeAsBytes(byteData.buffer.asUint8List());

    return tempFile;
  }



}