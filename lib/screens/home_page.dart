import 'package:flutter/material.dart';
import 'package:image_app/API/api_client.dart';
import 'package:image_app/BLoC/image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/app_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: BlocBuilder<ImageCubit, List<AppImage>>(
        builder: (context, state) {
          return Scaffold(
            body: GridView.builder(
              itemCount: state.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      state[index].url,
                    fit: BoxFit.cover,
                    ),
                  ),
                );
              },),
            floatingActionButton: FloatingActionButton(onPressed: () {
              context.read<ImageCubit>().getImages();
            },),
          );
        },
      ),
    );
  }
}
