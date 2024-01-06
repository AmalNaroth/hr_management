import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentScreen extends StatefulWidget {
  DepartmentScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  TextEditingController _departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Department Screen'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CustomTextWidget01 is not defined, make sure it's implemented
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
                                  controller: _departmentController,
                                  decoration: InputDecoration(
                                    labelText: "Department Name",
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
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
                            ...List.generate(10, (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text('${index + 1}'),
                                  ),
                                  DataCell(
                                    Text(""),
                                  ),
                                  DataCell(
                                    IconButton(
                                      onPressed: () {
                                        // Add the action when the button is pressed
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
        ));
  }
}
