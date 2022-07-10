// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petfinder/models/pet.dart';
import 'package:petfinder/repositories/pet_repository.dart';

part 'pet_list_state.dart';

class PetListCubit extends Cubit<PetListState> {
  final PetRepository petRepository;
  PetListCubit(
    this.petRepository,
  ) : super(PetListState.initial());

  void setPetList(List<Pet> pets) {
    emit(state.copyWith(pets: pets));
  }

  Future<void> refreshRandomImg() async {
    List<Pet> pets = [];

    for (var pet in state.pets) {
      final image =
          pet.image.isEmpty ? await petRepository.getRandomImage() : pet.image;
      final newPet = Pet(
        age: pet.age,
        breed: pet.breed,
        name: pet.name,
        ownerId: pet.ownerId,
        type: pet.type,
        image: image,
      );
      pets.add(newPet);
    }
    emit(state.copyWith(pets: pets));
  }
}
