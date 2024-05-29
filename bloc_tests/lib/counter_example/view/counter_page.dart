import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter Page'),
        ),
        body: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$state',
                  ),
                  Text(
                    'counter',
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () =>
                            context.read<CounterCubit>().increment(),
                      ),
                      IconButton(
                          onPressed: () =>
                              context.read<CounterCubit>().decrement(),
                          icon: Icon(Icons.remove))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
