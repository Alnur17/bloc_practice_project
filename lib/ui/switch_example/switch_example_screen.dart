import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_example/switch_bloc.dart';
import '../../bloc/switch_example/switch_event.dart';
import '../../bloc/switch_example/switch_state.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Switch Example')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print('notifications');
                    return Switch(value: state.isSwitch, onChanged: (value) {
                      print(value);
                      context.read<SwitchBloc>().add(ToggleSwitch());
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                print('slider container');
                return Container(
                    height: 200, color: Colors.red.withOpacity(state.slider));
              },
            ),
            SizedBox(height: 40),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.slider != current.slider,
              builder: (context, state) {
                print('slider');
                return Slider(value: state.slider, onChanged: (value) {
                  print(value);
                  context.read<SwitchBloc>().add(SliderEvent(sliderValue: value));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
