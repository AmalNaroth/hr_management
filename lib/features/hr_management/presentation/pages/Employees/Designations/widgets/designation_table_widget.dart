import 'package:flutter/material.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/department_entity.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/designation_entity.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/Designations/widgets/add_designation_bottomsheet_widget.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class DesignationTableWidget extends StatelessWidget {
  List<DesignationEntity> designationData;
  List<DepartmentEntity> departmentData;
  DesignationTableWidget(
      {super.key, required this.departmentData, required this.designationData});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return AddDesignationBottomSheetWidget(
                      departmentData: departmentData,
                    );
                  },
                );
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
                          ...List.generate(designationData.length, (index) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Text("${index + 1}"),
                                ),
                                DataCell(
                                  Text(designationData[index].name),
                                ),
                                DataCell(
                                  Text(designationData[index].department),
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
    );
  }
}
