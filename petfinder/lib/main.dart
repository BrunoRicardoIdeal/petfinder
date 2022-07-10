import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfinder/pages/home_page.dart';
import 'package:petfinder/repositories/pet_repository.dart';
import 'package:petfinder/services/dog_api_services.dart';
import 'package:http/http.dart' as http;

import 'cubits/cubits.dart';

void main() {
  runApp(const PetfinderApp());
}

class PetfinderApp extends StatelessWidget {
  const PetfinderApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PetRepository(
          dogApiServices: DogApiServices(httpClient: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PetListCubit(context.read<PetRepository>()),
          )
        ],
        child: MaterialApp(
          title: 'Pet finder',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
