// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'package:petfinder/constants/api_constants.dart';
import 'package:petfinder/exceptions/dog_exception.dart';
import 'dart:io';

import 'package:petfinder/exceptions/http_error_handler.dart';
import 'package:petfinder/models/random_dog_img.dart';

class DogApiServices {
  final http.Client httpClient;
  DogApiServices({
    required this.httpClient,
  });

  Future<String> getRandomImage() async {
    final uri =
        Uri(scheme: 'https', host: kRandomDogImgHost, path: kRandomDogImgPath);

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != HttpStatus.ok) {
        throw httpErrorHandler(response);
      }
      final body = response.body;
      final randomDogImg = RandomDogImg.fromJson(body);

      if (randomDogImg.status != 'success') {
        throw DogException(message: 'Could not get dog image.');
      }

      return randomDogImg.message;
    } catch (e) {
      rethrow;
    }
  }
}
