// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petfinder/services/dog_api_services.dart';

class PetRepository {
  final DogApiServices dogApiServices;
  PetRepository({
    required this.dogApiServices,
  });

  Future<String> getRandomImage() async {
    return await dogApiServices.getRandomImage();
  }
}
