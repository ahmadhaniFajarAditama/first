import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterday3/homepage/homepage_cubit.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter App Using Cubit'),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<HomepageCubit, int>(
              builder: (context, state){
                return Text(
                  'CUNTER : $state',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.blueGrey,
                  ),
                );
              }
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomepageCubit>().increment();
              }, 
              child: Text(
                'Increment',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomepageCubit>().decrement();
              }, 
              child: Text(
                'Decrement',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<HomepageCubit>().reset();
              }, 
              child: Text(
                'Reset',
              ),
            ),
          ],
        ),
      ),
    );
  }
}