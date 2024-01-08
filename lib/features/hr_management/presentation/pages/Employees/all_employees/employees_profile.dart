import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/new_employee_model.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class EmployeesProfile extends StatelessWidget {
  final NewEmployeeModelEntity data;
  const EmployeesProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget01(
          textValue: "Profile",
          fontColors: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    fHight30,
                    CircleAvatar(
                      radius: mWidth! * .15,
                      backgroundImage: NetworkImage(data.imageFile),
                    ),
                    fHight10,
                    CustomTextWidget01(
                        textValue: data.userName,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                    fHight10,
                    CustomTextWidget01(
                        textValue: data.department,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontColors: Colors.grey),
                    fHight10,
                    CustomTextWidget01(
                        textValue: data.designation,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontColors: Colors.grey),
                    fHight10,
                    Text(
                      "Employee ID : ${data.employeeId}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    fHight10,
                    CustomTextWidget01(
                      textValue: "Date of Join : 1st Jan 2013",
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontColors: Colors.grey,
                    ),
                    fHight20,
                    ElevatedButton(
                      onPressed: () {},
                      child: CustomTextWidget01(
                          textValue: "Send Message",
                          fontColors: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 19),
                    ),
                    fHight20,
                    Row(
                      children: List.generate(
                        150 ~/ 3,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.grey,
                            height: 2,
                          ),
                        ),
                      ),
                    ),
                    fHight30,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget01(
                                    textValue: "First Name",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Last Name",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "User Name",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Email :",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Phone Number :",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Department",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Designation",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                                fHight20,
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget01(
                                    textValue: "Amal",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Naroth",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Amal Naroth",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "amal@gamil.com",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "5415150515S",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "App Development",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight10,
                                CustomTextWidget01(
                                    textValue: "Flutter",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontColors: Colors.black54),
                                fHight20,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    fHight30,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
