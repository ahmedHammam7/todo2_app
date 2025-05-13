import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Bloc/TodoCubit.dart';
import 'package:todo_app/Bloc/TodoStates.dart';
import 'package:todo_app/Items/ListItem.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text(
                "What's up,Ahmed!",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 30),
            const  Text(
                "Today's Tasks",
                style: TextStyle(
                    color: Color(0xff627ecd), fontWeight: FontWeight.bold),
              ),
             const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ListItem(BlocProvider.of<TodoCubit>(context).tasks1[index]),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                    itemCount: BlocProvider.of<TodoCubit>(context).tasks1.length),
              )
            ],
          ),
        );
      },
    );
  }
}
