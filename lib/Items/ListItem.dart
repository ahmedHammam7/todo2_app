import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/TodoCubit.dart';
import '../Bloc/TodoStates.dart';

Widget ListItem(Map model) => BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff041955),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(model["title"],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                subtitle: Text(model["body"],
                    style: const TextStyle(color: Color(0xffeb06ff)),
                    maxLines: 4),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
BlocProvider.of<TodoCubit>(context).deleteDataBaseRecord(model["body"]);
                  },
                  icon:const Icon(Icons.delete,color: Colors.white,size: 30),
                ),

              )),
        );
      },
    );
