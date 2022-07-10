import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pet_filter_state.dart';

class PetFilterCubit extends Cubit<PetFilterState> {
  PetFilterCubit() : super(PetFilterState.initial());

  void setFilter(int age, String name, type) {
    emit(state.copyWith(age: age, name: name, type: type));
  }
}
