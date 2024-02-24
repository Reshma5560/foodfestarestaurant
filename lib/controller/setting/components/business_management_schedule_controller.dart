import 'package:foodfestarestaurant/data/models/get_schedule_model.dart';
import 'package:foodfestarestaurant/repositories/account_repositories.dart';
import 'package:get/get.dart';

class BusinessManagementScheduleController extends GetxController {
  final List<String> days = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];

  List<Map> items = [];

  Rx<GetScheduleData> getScheduleData = GetScheduleData().obs;

  RxBool isLoader = false.obs;

  RxString selectedMondayOpening = 'closed'.obs;
  RxString selectedMondayClosing = 'closed'.obs;

  RxString selectedTuesdayOpening = 'closed'.obs;
  RxString selectedTuesdayClosing = 'closed'.obs;

  RxString selectedWendesdayOpening = 'closed'.obs;
  RxString selectedWendesdayClosing = 'closed'.obs;

  RxString selectedThursdayOpening = 'closed'.obs;
  RxString selectedThursdayClosing = 'closed'.obs;

  RxString selectedFridayOpening = 'closed'.obs;
  RxString selectedFridayClosing = 'closed'.obs;

  RxString selectedSaturdayOpening = 'closed'.obs;
  RxString selectedSaturdayClosing = 'closed'.obs;

  RxString selectedSundayOpening = 'closed'.obs;
  RxString selectedSundayClosing = 'closed'.obs;

  List _buildDropdownItems1() {
    items.insert(0, {"value": 'closed', "text": "Closed"});
    for (int i = 0; i < 24; i++) {
      items.add({"value": '$i', "text": _formatTime(i)});
      items.add({"value": '$i:30', "text": _formatTime1(i)});
    }
    return items;
  }

  String _formatTime(int hour) {
    return hour >= 12
        ? '${hour % 12 == 0 ? 12 : hour % 12} PM'
        : '${hour == 0 ? 12 : hour} AM';
  }

  String _formatTime1(int hour) {
    return hour >= 12
        ? '${hour % 12 == 0 ? 12 : hour % 12}:30 PM'
        : '${hour == 0 ? 12 : hour}:30 AM';
  }

  @override
  Future<void> onReady() async {
    _buildDropdownItems1();
    await AccountRepository()
        .getBusinessManagementScheduleConfigApiCall(isLoader: isLoader);
    super.onReady();
  }
}
