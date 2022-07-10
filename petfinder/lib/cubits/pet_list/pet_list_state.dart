// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pet_list_cubit.dart';

class PetListState extends Equatable {
  final List<Pet> pets;
  const PetListState({
    required this.pets,
  });

  factory PetListState.initial() {
    final names = [
      'Rex',
      'Luna',
      'Bamboo ',
      'Brisk',
      'Sequoia',
      'Toast',
      'Comet'
    ];
    final ages = [2, 5, 3, 4, 6, 10, 12];
    final breeds = [
      'Beagle',
      'Rotweiler',
      'Pitbull',
      'Pug',
      'Boxer',
      'Cavador',
      'Other'
    ];

    List<Pet> pets = [];
    for (int i = 0; i < names.length; i++) {
      pets.add(Pet(
          age: ages[i],
          breed: breeds[i],
          image: '',
          name: names[i],
          ownerId: 0,
          type: 'dog'));
    }

    return PetListState(pets: pets);
  }

  PetListState copyWith({
    List<Pet>? pets,
  }) {
    return PetListState(
      pets: pets ?? this.pets,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [pets];
}
