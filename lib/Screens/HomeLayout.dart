import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Bloc/TodoCubit.dart';
import 'package:todo_app/Bloc/TodoStates.dart';
import 'package:todo_app/Customs/CustomButton.dart';
import 'package:todo_app/Customs/CustomTextField.dart';
import 'package:todo_app/Items/TodoBody.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      BlocProvider.of<TodoCubit>(context).GetDataBase();
      return BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) {
          var titleController = TextEditingController();
          var BodyController = TextEditingController();
          var TimeController = TextEditingController();
          var DateController = TextEditingController();
          return Scaffold(
              backgroundColor: const Color(0xff3450a1),
              appBar: AppBar(
                  backgroundColor: const Color(0xff3450a1),
                  elevation: 0.1,
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.bell))
                  ]),
              drawer: const Drawer(
                  backgroundColor: Color(0xff041955),
                  elevation: 0.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 53,
                          backgroundColor: Color(0xffeb06ff),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "lib/assets/WhatsApp Image 2023-06-29 at 19.51.35.jpg"),
                            radius: 50,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Ahmed",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hammam",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.bookmark,
                                color: Color(0xff3450a1)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Templates",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.tableCells,
                                color: Color(0xff3450a1)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.chartPie,
                                color: Color(0xff3450a1)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Analytics",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              body: const TodoBody(),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xffeb06ff),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: const Color(0xff041955),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CustomFormTextField(
                                icon: Icons.title,
                                controller: titleController,
                                obsecure: false,
                                label: "Title",
                                keyboard: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              CustomFormTextField(
                                icon: Icons.task_sharp,
                                controller: BodyController,
                                obsecure: false,
                                label: "Body",
                                keyboard: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              CustomFormTextField(
                                icon: Icons.date_range,
                                controller: DateController,
                                obsecure: false,
                                label: "Date",
                                keyboard: TextInputType.datetime,
                                ontab: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2021),
                                          lastDate: DateTime(2042))
                                      .then((value) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(value!);
                                    DateController.text =
                                        formattedDate.toString();
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: CustomFormTextField(
                                  icon: Icons.timelapse,
                                  controller: TimeController,
                                  obsecure: false,
                                  label: "Time",
                                  keyboard: TextInputType.datetime,
                                  ontab: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      TimeController.text =
                                          value!.format(context).toString();
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomButtom(
                                text: "Add",
                                ontab: () {
                                  BlocProvider.of<TodoCubit>(context)
                                      .InsertDataBase(
                                          titleController.text,
                                          BodyController.text,
                                          DateController.text,
                                          TimeController.text);
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ));
        },
      );
    });
  }
}
