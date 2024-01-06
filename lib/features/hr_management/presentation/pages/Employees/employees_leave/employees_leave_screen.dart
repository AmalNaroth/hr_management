import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/employees_leave/widgets/employees_addleave_bottom_sheet.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class EmployeesLeaveScreen extends StatelessWidget {
  final DataTableSource _data = MyData();
  EmployeesLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget01(
                  textValue: "Leaves",
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
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      context: context, builder: (context) {
                      return EmployeeAddLeaveBottomSheet();
                    },);
                  },
                  icon: Icon(Icons.add),
                  label: CustomTextWidget01(
                    textValue: "Add Leave",
                    fontSize: 18,
                    fontColors: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              EmployeesLeaveCardWidget(
                cardTitle: "Annual Leave",
                totalLeave: 12,
              ),
              fHight20,
              EmployeesLeaveCardWidget(
                  cardTitle: "Medical Leave", totalLeave: 3),
              fHight20,
              EmployeesLeaveCardWidget(cardTitle: "Other Leave", totalLeave: 4),
              fHight20,
              EmployeesLeaveCardWidget(
                  cardTitle: "Remaining Leave", totalLeave: 5),
                  fHight20,
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 20),
                child: PaginatedDataTable(
                  columns: [
                    DataColumn(
                      label: Text("Leave Type"),
                    ),
                    DataColumn(
                      label: Text("From"),
                    ),
                    DataColumn(
                      label: Text("To"),
                    ),
                    DataColumn(
                      label: Text("No of Days"),
                    ),
                    DataColumn(
                      label: Text("Reason"),
                    ),
                    DataColumn(
                      label: Text("Status"),
                    ),
                    DataColumn(
                      label: Text("Approved by"),
                    ),
                    DataColumn(
                      label: Text("Actions"),
                    ),
                  ],
                  source: _data,
                  columnSpacing: 50,
                ),
              )
            ],
          )
        ],
      ),
      //drawer: DrawerCardWidget(),
    );
  }
}



class EmployeesLeaveCardWidget extends StatelessWidget {
  final String cardTitle;
  final int totalLeave;
  const EmployeesLeaveCardWidget(
      {super.key, required this.cardTitle, required this.totalLeave});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget01(
                    textValue: cardTitle,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                fHight10,
                CustomTextWidget01(
                    textValue: "$totalLeave",
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(200, (index) {
    return {
      "Leave Type": "Casual Leave",
      "From": "8 Mar 2023",
      "To": '9 Mar 2023',
      "No of Days": "2 days",
      "Reason": "Goining to Hospital",
      "Status": "New",
      "Approved by": "Amal Naroth",
      "Action": "..."
    };
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(data[index]['Leave Type']),
      ),
      DataCell(
        Text(data[index]['From']),
      ),
      DataCell(
        Text(data[index]['To']),
      ),
      DataCell(
        Text(data[index]['No of Days']),
      ),
      DataCell(
        Text(data[index]['Reason']),
      ),
      DataCell(
        Text(data[index]['Status']),
      ),
      DataCell(
        Text(data[index]['Approved by']),
      ),
      DataCell(
        Text(data[index]['Action']),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
