import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_management_new/core/resources/data_state.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_model.dart';
import 'package:hr_management_new/features/hr_management/domain/employees/holiday/holiday_services.dart';
import 'package:hr_management_new/features/hr_management/domain/entities/holiday_entity.dart';
import 'package:injectable/injectable.dart';

part 'holiday_event.dart';
part 'holiday_state.dart';

@injectable
class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  HolidayBloc(HolidayServices holidayIntance) : super(HolidayInitialState()) {
    on<HolidaySubmitButtonClickEvent>(
      (event, emit) async {
        {
          final result =
              await holidayIntance.addNewHolidayDb(data: event.holidayData);
          if (result is DataSuccess) {
            emit(NewHolidaySubmitState(message: result.data));
          } else {
            emit(
              HolidayErrorState(),
            );
          }

          final data = await holidayIntance.getHolidayDataDb();
          if (data is DataSuccess) {
            emit(
              HolidayInitialState(holidayData: data.data),
            );
          } else {
            emit(
              HolidayErrorState(),
            );
          }
        }
      },
    );

    on<HolidayInitialEvent>((event, emit) async{
          emit(
            HolidayLoadingState(),
          );
           final data = await holidayIntance.getHolidayDataDb();
          if (data is DataSuccess) {
            print(data.data);
            emit(
              HolidayInitialState(holidayData: data.data),
            );
          } else {
            emit(
              HolidayErrorState(),
            );
          }
        });
  }
}
