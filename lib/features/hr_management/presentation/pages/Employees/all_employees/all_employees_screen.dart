import 'package:flutter/material.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/core/util/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

List<String> employeeDesignationList = [
  "Web Developer",
  "Web Designer",
  "Android Developer",
  "IOS Developer",
  "Flutter Developer",
];

class AllEmployeesScreen extends StatefulWidget {
  const AllEmployeesScreen({super.key});

  @override
  State<AllEmployeesScreen> createState() => _AllEmployeesScreenState();
}

class _AllEmployeesScreenState extends State<AllEmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget01(
                          textValue: "Employee",
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                         // NavigatorService.pushNamed();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add Employee"),
                      )
                    ],
                  ),
                  fHight30,
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Employee ID", border: OutlineInputBorder()),
                  ),
                  fHight10,
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Employee Name",
                        border: OutlineInputBorder()),
                  ),
                  fHight20,
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text("Select Designation"),
                    items: employeeDesignationList.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                  fHight20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size.fromHeight(50)),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SEARCH"),
                      ],
                    ),
                  ),
                  fHight20,
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Row(
                                            children: [
                                              Icon(Icons.edit),
                                              fWidth10,
                                              Text("Edit"),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                            child: Row(
                                          children: [
                                            Icon(Icons.delete),
                                            fWidth10,
                                            Text("Delete"),
                                          ],
                                        ))
                                      ];
                                    },
                                  )
                                ],
                              ),
                              CircleAvatar(
                                radius: mWidth! * .08,
                                child: FlutterLogo(),
                              ),
                              fHight10,
                              CustomTextWidget01(
                                  textValue: "John Doe",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              fHight5,
                              CustomTextWidget01(
                                textValue: "Web Designer",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              )),
        ),
      ),
     // drawer: const DrawerCardWidget(),
    );
  }
}
