import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/core/util/textediting_controlles.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/employees/employees_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/add_employees_screen.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/all_employees/employees_profile.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

Map<String, List<String>> departmentMap = {};

class AllEmployeesScreen extends StatefulWidget {
  const AllEmployeesScreen({super.key});

  @override
  State<AllEmployeesScreen> createState() => _AllEmployeesScreenState();
}

class _AllEmployeesScreenState extends State<AllEmployeesScreen> {
  @override
  void initState() {
    context.read<EmployeesBloc>().add(
          EmployeesInitlaEvent(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                        fontWeight: FontWeight.w600,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddNewEmployeeScreen(
                                  departmentMap: departmentMap),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add Employee"),
                      )
                    ],
                  ),
                  fHight30,
                  TextFormField(
                    controller: EmployeesControlls.seachEmployeeController,
                    decoration: const InputDecoration(
                      hintText: "Employee Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  fHight20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      BlocProvider.of<EmployeesBloc>(context).add(
                        EmployeesSearchEvent(
                          employeeName: EmployeesControlls
                              .seachEmployeeController.text
                              .trim(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SEARCH"),
                      ],
                    ),
                  ),
                  fHight20,

                  //bloc implemented
                  BlocConsumer<EmployeesBloc, EmployeesState>(
                    builder: (context, state) {
                      if (state is EmployeesLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is EmployeeSearchState) {
                        return _employeeList(data: state.searchData);
                      } else if (state is EmployeesInitialState) {
                        return _employeeList(data: state.employeeListData);
                      } else {
                        return Center(
                          child: CustomTextWidget01(textValue: "Error found"),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is EmployeesInitialState) {
                        departmentMap = state.departmentMap;
                      } else if (state is EmployeesSuccessState) {
                        EmployeesControlls.conformPasswordController.clear();
                        EmployeesControlls.firstNameController.clear();
                        EmployeesControlls.lastNameController.clear();
                        EmployeesControlls.userNameController.clear();
                        EmployeesControlls.emailController.clear();
                        EmployeesControlls.passwordController.clear();
                        EmployeesControlls.employeeId.clear();
                        NavigatorService.goBack();
                        CustomTextWidget01(textValue: state.successMessage);
                      }
                    },
                  )
                ],
              )),
        )
        // drawer: const DrawerCardWidget(),
        );
  }
}

Widget _employeeList({required List<NewEmployeeModelEntity> data}) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: data.length,
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EmployeesProfile(data: data[index]),
            ),
          );
        },
        child: Card(
          child: SizedBox(
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
                          const PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                fWidth10,
                                Text("Edit"),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(Icons.delete),
                                fWidth10,
                                Text("Delete"),
                              ],
                            ),
                          )
                        ];
                      },
                    )
                  ],
                ),
                CircleAvatar(
                  radius: mWidth! * .08,
                  backgroundImage: NetworkImage(
                    data[index].imageFile,
                  ),
                ),
                fHight10,
                CustomTextWidget01(
                    textValue: data[index].userName,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                fHight5,
                CustomTextWidget01(
                  textValue: data[index].department,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
