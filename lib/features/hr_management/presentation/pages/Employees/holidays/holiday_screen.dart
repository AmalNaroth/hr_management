import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_new/core/util/navigator_service/navigator_services.dart';
import 'package:hr_management_new/features/hr_management/application/bloc/holiday/holiday_bloc.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/holiday_entity.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/Employees/holidays/add_holiday_bottomsheet.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_snackbar.dart';
import 'package:hr_management_new/features/hr_management/presentation/pages/widgets/custom_text_widget01.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({Key? key}) : super(key: key);

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  @override
  void initState() {
    BlocProvider.of<HolidayBloc>(context).add(
      HolidayInitialEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holiday Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<HolidayBloc, HolidayState>(
          builder: (context, state) {
            if (state is HolidayLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HolidayErrorState) {
              return CustomTextWidget01(textValue: "Error");
            } else if (state is HolidayInitialState) {
              return buildHolidayList(
                  context: context, holidayData: state.holidayData);
            } else {
              return CustomTextWidget01(textValue: "Error");
            }
          },
          listener: (context, state) {
            if (state is NewHolidaySubmitState) {
              customSnackBar(state.message, context);
              NavigatorService.goBack();
            }
          },
        ),
      ),
    );
  }

  Widget buildHolidayList(
      {required BuildContext context,
      required List<HolidayEntity> holidayData}) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget01(
              textValue: "Holidays 2024",
              fontSize: 20,
              fontWeight: FontWeight.w500,
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
                    return const AddHolidayBottomSheet();
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Holiday"),
            )
          ],
        ),
        const SizedBox(height: 20),
        buildHolidayTable(holidayData: holidayData),
      ],
    );
  }

  Widget buildHolidayTable({required List<HolidayEntity> holidayData}) {
    return Table(
      border: TableBorder.all(color: Colors.white30),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.redAccent),
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("#"),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Title"),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Holiday"),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Day"),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Action"),
              ),
            ),
          ],
        ),
        ...List.generate(
          holidayData.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${index + 1}"),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(holidayData[index].holidayTitle),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(holidayData[index].holidayData),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(holidayData[index].holiday),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
