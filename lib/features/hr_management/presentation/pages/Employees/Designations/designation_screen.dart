import 'package:flutter/material.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';



class DesignationScreen extends StatelessWidget {
  DesignationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget01(
                textValue: "Designation",
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // showModalBottomSheet(
                  //   shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20),
                  //       topRight: Radius.circular(20),
                  //     ),
                  //   ),
                  //   context: context,
                  //   builder: (context) {
                  //     return AddDesignationBottomSheetWidget();
                  //   },
                  // );
                },
                icon: const Icon(Icons.add),
                label: CustomTextWidget01(
                  textValue: "Add Designation",
                  fontSize: 18,
                  fontColors: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
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
                              label: Text('Designation'),
                            ),
                            DataColumn(
                              label: Text('Department'),
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
                                    Text(""),
                                  ),
                                  DataCell(
                                    Text(""),
                                  ),
                                  DataCell(
                                    Text(""),
                                  ),
                                  DataCell(
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert_rounded),
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
          ),
        ],
      ),
      //drawer: const DrawerCardWidget(),
    );
  }
}
