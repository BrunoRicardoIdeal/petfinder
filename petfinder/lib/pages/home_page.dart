import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinder/cubits/pet_list/pet_list_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PetListCubit>().refreshRandomImg();
  }

  @override
  Widget build(BuildContext context) {
    final pets = context.watch<PetListCubit>().state.pets;

    return Scaffold(
      appBar: AppBar(title: const Text('Pet finder')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: pets.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: SizedBox(
                      width: 50,
                      child: pets[index].image.isEmpty
                          ? const CircularProgressIndicator()
                          : Image(
                              image: NetworkImage(pets[index].image),
                              fit: BoxFit.fill,
                            )),
                  title: Text(pets[index].name),
                  subtitle: Text('Age: ${pets[index].age} yrs'),
                ),
              );
            }),
      ),
    );
  }
}
