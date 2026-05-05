import 'package:block_practice_project/bloc/counter/counter_bloc.dart';
import 'package:block_practice_project/bloc/switch_example/switch_bloc.dart';
import 'package:block_practice_project/ui/image_picker/image_picker_screen.dart';
import 'package:block_practice_project/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/image_picker/image_picker_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        title: 'Bloc Practice project',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ImagePickerScreen(),
      ),
    );
  }
}
