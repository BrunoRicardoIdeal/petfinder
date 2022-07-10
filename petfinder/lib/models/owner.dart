// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petfinder/models/pet.dart';

class Owner {
  int id;
  int userId;
  String userName;
  List<Pet> pets;
  Owner({
    this.id = 0,
    this.userId = 0,
    this.userName = '',
    this.pets = const [],
  });
}
