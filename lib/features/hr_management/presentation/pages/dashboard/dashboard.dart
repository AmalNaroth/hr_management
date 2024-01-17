import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/dashBoard/dash_board_bloc.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';
import 'package:hr_management_new/features/hr_management/presentation/widgets/home_drawer_widget.dart';

final GlobalKey<ScaffoldState> _skey = GlobalKey();

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashBoardBloc>().add(
          DashboardInitialEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _skey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              _skey.currentState!.openDrawer();
            },
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  VerticalDivider(
                    thickness: 2,
                  ),
                  fWidth20,
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?q=80&w=2021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          if (state is DashboardSuccessState) {
            return dashboardPage(
                totalEmployee: state.employeeCount,
                totalDepartment: state.departmentCount,
                totalDesignation: state.departmentCount);
          } else if (state is DashboardErrorState) {
            return CustomTextWidget01(textValue: "Error");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: const DrawerCardWidget(),
    );
  }
}

Widget dashboardPage(
    {required int totalEmployee,
    required int totalDepartment,
    required int totalDesignation}) {
  return ListView(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    children: [
      CustomTextWidget01(
        textValue: "Welcome Back,",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontColors: Colors.grey,
      ),
      CustomTextWidget01(
          textValue: "Your perfect travel partner",
          fontSize: 17,
          fontColors: Colors.black45),
      fHight30,
      Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 4,
              color: Colors.black.withOpacity(0.3),
            )
          ],
          gradient: const LinearGradient(colors: [
            Color(0xff292459),
            Color(0xff8269B1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget01(
                textValue: "Savari",
                fontSize: 27,
                fontColors: Colors.white,
                fontWeight: FontWeight.w500),
            fHight20,
            CustomTextWidget01(
              textValue:
                  "Introducing the ultimate travel companion app, seamlessly combining personalized"
                  " itinerary planning, real-time navigation, and curated recommendations to"
                  " ensure a perfect journey tailored just for you.",
              fontSize: 17,
              fontColors: Colors.white60,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
      fHight30,
      ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return DashBoardBoxWidget(
              imageUrl: dashBoardItems.values.elementAt(index),
              title: dashBoardItems.keys.elementAt(index),
              total: totalEmployee.toString(),
            );
          },
          separatorBuilder: (context, index) {
            return fHight20;
          },
          itemCount: dashBoardItems.length)
    ],
  );
}

class DashBoardBoxWidget extends StatelessWidget {
  final String title;
  final String total;
  final String imageUrl;
  const DashBoardBoxWidget(
      {super.key,
      required this.title,
      required this.total,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget01(
                textValue: title,
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontColors: Colors.grey,
              ),
              fHight10,
              CustomTextWidget01(
                textValue: total,
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Map<String, String> dashBoardItems = {
  "Total employees": "assets/images/employees_image.jpg",
  "Total designation": "assets/images/designation_image.jpg",
  "Total department": "assets/images/department_image.jpg",
};
