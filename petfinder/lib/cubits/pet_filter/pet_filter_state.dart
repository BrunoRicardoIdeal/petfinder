// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pet_filter_cubit.dart';

class PetFilterState extends Equatable {
  final int age;
  final String name;
  final String type;
  const PetFilterState({
    required this.age,
    required this.name,
    required this.type,
  });

  factory PetFilterState.initial() {
    return const PetFilterState(age: 0, name: '', type: '');
  }

  PetFilterState copyWith({
    int? age,
    String? name,
    String? type,
  }) {
    return PetFilterState(
      age: age ?? this.age,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [age, name, type];
}
