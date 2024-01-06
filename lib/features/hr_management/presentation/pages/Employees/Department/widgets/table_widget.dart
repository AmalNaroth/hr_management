import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/department/department_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';

class DepartmentTableWidget extends StatelessWidget {
  List<DepartmentEntity> data;
   DepartmentTableWidget({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Departments",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Add Department"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    TextField(
                                      controller: DepartmentControllers.departmentController,
                                      decoration: InputDecoration(
                                        labelText: "Department Name",
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<DepartmentBloc>().add(
                                              NewDepartmentEvent(
                                                departmentName:
                                                    DepartmentControllers.departmentController.text
                                                        .trim(),
                                              ),
                                            );
                                      },
                                      child: const Text("Submit"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        "Add Department",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            DataTable(
                              columns: const [
                                DataColumn(
                                  label: Text('#'),
                                ),
                                DataColumn(
                                  label: Text('Department Name'),
                                ),
                                DataColumn(
                                  label: Text('Action'),
                                ),
                              ],
                              rows: [
                                ...List.generate(data.length,
                                    (index) {
                                  return DataRow(
                                    cells: [
                                      DataCell(
                                        Text('${index + 1}'),
                                      ),
                                      DataCell(
                                        Text(data[index].name),
                                      ),
                                      DataCell(
                                        IconButton(
                                          onPressed: () {
                                            // Add the action when the button is pressed
                                            // For example, showMenu, navigate to another screen, etc.
                                            // Replace the comment with your actual implementation.
                                          },
                                          icon: const Icon(
                                            Icons.more_vert_rounded,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
  }
}