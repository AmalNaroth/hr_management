import 'package:flutter/material.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_calander_widget01.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/widgets/custom_dropdown_button01.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class EmployeesAttendenceScreen extends StatelessWidget {
  final DataTableSource _data = MyData();
  EmployeesAttendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomCalenderFormField(fieldTitle: "Date"),
                  // CustomDropDownButton01(
                  //     listItems: ["Jan", "Feb"],
                  //     title: "Select the month",
                  //     hintText: "_"),
                  // CustomDropDownButton01(
                  //     listItems: ["2023", '2024'],
                  //     title: "Select the year",
                  //     hintText: "_"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 2, 239, 10),
                        fixedSize: Size.fromHeight(50)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextWidget01(
                            textValue: "SEARCH",
                            fontColors: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 20),
              child: PaginatedDataTable(
                columns: [
                  DataColumn(
                    label: Text("#"),
                  ),
                  DataColumn(
                    label: Text("Date"),
                  ),
                  DataColumn(
                    label: Text("Punch In"),
                  ),
                  DataColumn(
                    label: Text("Punch Out"),
                  ),
                  DataColumn(
                    label: Text("Production"),
                  ),
                  DataColumn(
                    label: Text("Break"),
                  ),
                  DataColumn(
                    label: Text("Over time"),
                  ),
                ],
                source: _data,
                columnSpacing: 50,
              ),
            )
          ],
        ),
      ),
     // drawer: const DrawerCardWidget(),
    );
  }
}

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> data = List.generate(
    100,
    (index) {
      return {
        "index": "1",
        "Date": "8 Mar 2023",
        "Punch In": '10 AM',
        "Punch Out": "7 PM",
        "Production": "9 hrs",
        "Break": "1 hrs",
        "Overtime": "0",
      };
    },
  );

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Text(data[index]['index']),
      ),
      DataCell(
        Text(data[index]['Date']),
      ),
      DataCell(
        Text(data[index]['Punch In']),
      ),
      DataCell(
        Text(data[index]['Punch Out']),
      ),
      DataCell(
        Text(data[index]['Production']),
      ),
      DataCell(
        Text(data[index]['Break']),
      ),
      DataCell(
        Text(data[index]['Overtime']),
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
