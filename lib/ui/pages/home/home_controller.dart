import 'dart:async';

import 'package:get/get.dart';
import 'package:smoquit/ui/shared/base_controller.dart';
import 'package:smoquit/util/date_formatter.dart';

class HomeController extends BaseController {
  String lastSmokeDate = '';

  late Timer t;
  RxString stopWatchTime = '00:00:00'.obs;

  RxString moneySaved = '0'.obs;
  RxString cig = '0'.obs;

  RxString day = '0'.obs;
  RxString month = '0'.obs;
  RxString year = '0'.obs;
  RxString week = '0'.obs;
  RxString hour = '0'.obs;
  RxString min = '0'.obs;
  RxString second = '0'.obs;

  int startDate = 1721935957000;
  int? currentDate;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    currentDate = DateTime.now().millisecondsSinceEpoch;
    startTimer();
  }

  startTimer() {
    print('Current Time $currentDate - Start Date : $startDate');
    int difference = ((currentDate! - startDate) / 1000).floor();
    print('difference in Seconds $difference');

    int ticker = 0;

    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      ticker += 1;
      int inSeconds = difference + ticker;
      calculateDays(inSeconds);
      calculateCigAndMoney(inSeconds);
    });
  }

  calculateDays(int totalSeconds) {
    // Constants
    const int secondsInADay = 86400;
    const double daysInAMonth = 30.44;
    const double daysInAYear = 365.25;

    // Calculate years
    int years = (totalSeconds / (secondsInADay * daysInAYear)).floor();
    int remainingSecondsAfterYears = totalSeconds - (years * secondsInADay * daysInAYear).toInt();

    // Calculate months
    int months = (remainingSecondsAfterYears / (secondsInADay * daysInAMonth)).floor();
    int remainingSecondsAfterMonths = remainingSecondsAfterYears - (months * secondsInADay * daysInAMonth).toInt();

    // Calculate days
    int days = (remainingSecondsAfterMonths / secondsInADay).floor();
    int remainingSecondsAfterDays = remainingSecondsAfterMonths - (days * secondsInADay);

    // Remaining seconds
    int remainingSeconds = remainingSecondsAfterDays;

    print('Years: $years, Months: $months, Days: $days, Seconds: $remainingSeconds');

    year.value = "$years";
    month.value = "$months";
    day.value = "$days";

    stopWatchTime.value = formattedTimeFromSeconds(timeInSecond: remainingSeconds);
  }

  calculateCigAndMoney(int secondsNotSmoked) {
    // Constants
    int cigarettesPerDay = 5;
    int costPerCigarette = 20;

    int secondsInADay = 86400;

    // Calculate the number of days
    int daysNotSmoked = (secondsNotSmoked / secondsInADay).floor();

    // Calculate the total number of cigarettes not smoked
    int totalCigarettesNotSmoked = cigarettesPerDay * daysNotSmoked;

    // Calculate the total money saved
    int totalMoneySaved = totalCigarettesNotSmoked * costPerCigarette;

    print('Total cigarettes not smoked: $totalCigarettesNotSmoked');
    print('Total money saved: \$${totalMoneySaved}');

    cig.value = '${totalCigarettesNotSmoked}';
    moneySaved.value = '${totalMoneySaved}';
  }

  cancelTimer() {
    t.cancel();
  }

  reset(){

  }


  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }
}
